/* load-cell-v2-bricklet
 * Copyright (C) 2018 Olaf Lüke <olaf@tinkerforge.com>
 * Copyright (C) 2018 Ishraq Ibne Ashraf <ishraq@tinkerforge.com>
 *
 * hx711.h: HX711 load cell ADC driver
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

#ifndef HX711_H
#define HX711_H

#include <stdint.h>

#include "bricklib2/utility/moving_average.h"
#include "bricklib2/hal/system_timer/system_timer.h"
#include "bricklib2/utility/led_flicker.h"

typedef struct {
	LEDFlickerState info_led_flicker_state;

	uint8_t gain;
	uint8_t rate;

	int32_t offset;
	int32_t gain_mul;
	int32_t gain_div;

	int32_t tare_value;

	int32_t weight;

	MovingAverage moving_average_weight;
} HX711;

extern HX711 hx711;

int32_t hx711_get_weight(void);
void hx711_calibration_write(void);
void hx711_init(void);
void hx711_tick(void);

#endif
