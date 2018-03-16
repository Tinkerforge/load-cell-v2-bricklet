/* load-cell-v2-bricklet
 * Copyright (C) 2018 Olaf Lüke <olaf@tinkerforge.com>
 *
 * hx711.c: HX711 load cell ADC driver
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 */

#include "hx711.h"

#include "communication.h"

#include "configs/config_hx711.h"

#include "bricklib2/utility/util_definitions.h"

#include <stdbool.h>

HX711 hx711;

static inline void hx711_sleep_100ns(void) {
	// To sleep at least 100ns we would have to use 3.2 clock cycles at 32MHz.
	// We use 4 NOPs as the best possible approximation available.
	__NOP(); __NOP(); __NOP(); __NOP();
}

static inline void hx711_sleep_half_clock_cycle(void) {
	// Use 16 NOPs, which will create a frequency of about 1MHz if the
	// CPU runs at 32 MHz and we sleep for every falling/rising edge.
	__NOP(); __NOP(); __NOP(); __NOP(); __NOP(); __NOP(); __NOP(); __NOP();
	__NOP(); __NOP(); __NOP(); __NOP(); __NOP(); __NOP(); __NOP(); __NOP();
	// During testing we found that this actually runs at about 600kHz, because
	// of the time lost with function calls and GPIO handling etc.
	// But 600kHz is OK too.
}

static inline bool clock_one_bit(void) {
	XMC_GPIO_SetOutputHigh(HX711_CLK_PIN);       // clock high
	hx711_sleep_half_clock_cycle();
	bool ret = XMC_GPIO_GetInput(HX711_DAT_PIN); // read bit
	XMC_GPIO_SetOutputLow(HX711_CLK_PIN);        // clock low
	hx711_sleep_half_clock_cycle();
	return ret;
}

void hx711_calibration_write(void) {
	uint32_t page[EEPROM_PAGE_SIZE/sizeof(uint32_t)];

	page[HX711_CALIBRATION_MAGIC_POS]      = HX711_CALIBRATION_MAGIC;
	page[HX711_CALIBRATION_OFFSET_POS]     = hx711.offset;
	page[HX711_CALIBRATION_MULTIPLIER_POS] = hx711.gain_mul;
	page[HX711_CALIBRATION_DIVISOR_POS]    = hx711.gain_div;

	bootloader_write_eeprom_page(HX711_CALIBRATION_PAGE, page);
}

void hx711_calibration_read(void) {
	uint32_t page[EEPROM_PAGE_SIZE/sizeof(uint32_t)];
	bootloader_read_eeprom_page(HX711_CALIBRATION_PAGE, page);

	// The magic number is not where it is supposed to be.
	// This is either our first startup or something went wrong.
	// We initialize the calibration data with sane default values.
	if(page[0] != HX711_CALIBRATION_MAGIC) {
		hx711.offset   = 0;
		hx711.gain_mul = 1;
		hx711.gain_div = 1;
		hx711_calibration_write();
		return;
	}

	hx711.offset   = page[HX711_CALIBRATION_OFFSET_POS];
	hx711.gain_mul = page[HX711_CALIBRATION_MULTIPLIER_POS];
	hx711.gain_div  = page[HX711_CALIBRATION_DIVISOR_POS];
}

void hx711_init(void) {
	memset(&hx711, 0, sizeof(HX711));
	hx711.gain = LOAD_CELL_V2_GAIN_128X;
	hx711.rate = LOAD_CELL_V2_RATE_10HZ;
	hx711.offset = 0;
	hx711.gain_mul = 1;
	hx711.gain_div = 1;
	hx711.tare_value = 0;

	hx711_calibration_read();

	moving_average_init(&hx711.moving_average_weight, 0, 4);

	const XMC_GPIO_CONFIG_t pin_low_config = {
		.mode         = XMC_GPIO_MODE_OUTPUT_PUSH_PULL,
		.output_level = XMC_GPIO_OUTPUT_LEVEL_LOW,
	};
	const XMC_GPIO_CONFIG_t pin_high_config = {
		.mode         = XMC_GPIO_MODE_OUTPUT_PUSH_PULL,
		.output_level = XMC_GPIO_OUTPUT_LEVEL_HIGH,
	};
	const XMC_GPIO_CONFIG_t input_config = {
		.mode             = XMC_GPIO_MODE_INPUT_TRISTATE,
		.input_hysteresis = XMC_GPIO_INPUT_HYSTERESIS_STANDARD
	};

	XMC_GPIO_Init(HX711_CLK_PIN, &pin_low_config);
	XMC_GPIO_Init(HX711_RATE_PIN, &pin_low_config);
	XMC_GPIO_Init(HX711_LED_PIN, &pin_high_config);

	XMC_GPIO_Init(HX711_DAT_PIN, &input_config);
}

void hx711_tick(void) {
	if(!XMC_GPIO_GetInput(HX711_DAT_PIN)) {
		hx711_sleep_100ns();  // Wait 0.1us before first clock edge (see hx711 datasheet page 5, T_1)

		__disable_irq();
		int32_t value = 0;
		for(uint8_t i = 0; i < 24; i++) {
			value |= clock_one_bit() << (23-i);
		}

		// 128x = 1 clock, 32x = 2 clock, 64x = 3 clock (see hx711 datasheet page 5, "next conversion")
		switch(hx711.gain) {
			case LOAD_CELL_V2_GAIN_64X:  clock_one_bit(); // fall-through
			case LOAD_CELL_V2_GAIN_32X:  clock_one_bit(); // fall-through
			case LOAD_CELL_V2_GAIN_128X: clock_one_bit();
		}
		__enable_irq();

		// 24 bit twos complement -> 32 bit twos complement
		if(value & 0x800000) {
			value |= 0xFF000000;
		}

		// Shift from [-a..+b] to [0..2b+1]
		value += 0x800000;

		hx711.weight = moving_average_handle_value(&hx711.moving_average_weight, value);
	}
}

int32_t hx711_get_weight(void) {
	const int64_t weight_offset = ((int64_t)hx711.weight) - ((int64_t)hx711.offset);
	const int64_t weight_offset_gain_mul = weight_offset*hx711.gain_mul + hx711.gain_div/2;
	const int64_t weight = weight_offset_gain_mul/hx711.gain_div;

	return weight + hx711.tare_value;
}
