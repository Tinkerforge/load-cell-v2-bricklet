/* load-cell-v2-bricklet
 * Copyright (C) 2018 Olaf Lüke <olaf@tinkerforge.com>
 * Copyright (C) 2018 Ishraq Ibne Ashraf <ishraq@tinkerforge.com>
 *
 * communication.c: TFP protocol message handling
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

#include "communication.h"

#include "bricklib2/utility/communication_callback.h"
#include "bricklib2/protocols/tfp/tfp.h"
#include "bricklib2/utility/callback_value.h"
#include "bricklib2/utility/moving_average.h"

#include "configs/config_hx711.h"
#include "hx711.h"
#include "xmc_gpio.h"

CallbackValue callback_value_weight;


BootloaderHandleMessageResponse handle_message(const void *message, void *response) {
	switch(tfp_get_fid_from_message(message)) {
		case FID_GET_WEIGHT: return get_callback_value(message, response, &callback_value_weight);
		case FID_SET_WEIGHT_CALLBACK_CONFIGURATION: return set_callback_value_callback_configuration(message, &callback_value_weight);
		case FID_GET_WEIGHT_CALLBACK_CONFIGURATION: return get_callback_value_callback_configuration(message, response, &callback_value_weight);
		case FID_SET_MOVING_AVERAGE: return set_moving_average(message);
		case FID_GET_MOVING_AVERAGE: return get_moving_average(message, response);
		case FID_SET_INFO_LED_CONFIG: return set_info_led_config(message);
		case FID_GET_INFO_LED_CONFIG: return get_info_led_config(message, response);
		case FID_CALIBRATE: return calibrate(message);
		case FID_TARE: return tare(message);
		case FID_SET_CONFIGURATION: return set_configuration(message);
		case FID_GET_CONFIGURATION: return get_configuration(message, response);
		default: return HANDLE_MESSAGE_RESPONSE_NOT_SUPPORTED;
	}
}


BootloaderHandleMessageResponse set_moving_average(const SetMovingAverage *data) {
	if((data->average > MOVING_AVERAGE_MAX_LENGTH) || (data->average < 1)) {
		return HANDLE_MESSAGE_RESPONSE_INVALID_PARAMETER;
	}

	moving_average_new_length(&hx711.moving_average_weight, data->average);

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_moving_average(const GetMovingAverage *data, GetMovingAverage_Response *response) {
	response->header.length = sizeof(GetMovingAverage_Response);
	response->average       = hx711.moving_average_weight.length;

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse set_info_led_config(const SetInfoLEDConfiguration *data) {
	if(data->configuration == LOAD_CELL_V2_INFO_LED_CONFIG_OFF) {
		hx711.info_led_flicker_state.config = LED_FLICKER_CONFIG_OFF;
		XMC_GPIO_SetOutputHigh(INFO_LED_PIN);
	}
	else if(data->configuration == LOAD_CELL_V2_INFO_LED_CONFIG_ON) {
		hx711.info_led_flicker_state.config = LED_FLICKER_CONFIG_ON;
		XMC_GPIO_SetOutputLow(INFO_LED_PIN);
	}
	else if(data->configuration == LOAD_CELL_V2_INFO_LED_CONFIG_HEARTBEAT) {
		hx711.info_led_flicker_state.config = LED_FLICKER_CONFIG_HEARTBEAT;
		hx711.info_led_flicker_state.start = system_timer_get_ms();
	}
	else {
		return HANDLE_MESSAGE_RESPONSE_INVALID_PARAMETER;
	}

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_info_led_config(const GetInfoLEDConfiguration *data,
                                                    GetInfoLEDConfiguration_Response *response) {
	response->header.length = sizeof(GetInfoLEDConfiguration_Response);
	response->configuration = hx711.info_led_flicker_state.config;

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse calibrate(const Calibrate *data) {
	if(data->weight == 0) {
		hx711.offset = hx711.weight;
	} else {
		int32_t offset = hx711.weight - hx711.offset;
		if(offset == 0) { // Don't allow offset of zero (results in divide by 0)
			return HANDLE_MESSAGE_RESPONSE_INVALID_PARAMETER;
		}

		hx711.gain_mul = data->weight;
		hx711.gain_div = offset;

		hx711_calibration_write();
	}

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse tare(const Tare *data) {
	hx711.tare_value -= hx711_get_weight();

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse set_configuration(const SetConfiguration *data) {
	if((data->gain > LOAD_CELL_V2_GAIN_32X) || (data->rate > LOAD_CELL_V2_RATE_80HZ)) {
		return HANDLE_MESSAGE_RESPONSE_INVALID_PARAMETER;
	}

	hx711.gain = data->gain;
	hx711.rate = data->rate;

	if(hx711.rate == LOAD_CELL_V2_RATE_10HZ) {
		XMC_GPIO_SetOutputLow(HX711_RATE_PIN);
	} else {
		XMC_GPIO_SetOutputHigh(HX711_RATE_PIN);
	}

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_configuration(const GetConfiguration *data, GetConfiguration_Response *response) {
	response->header.length = sizeof(GetConfiguration_Response);
	response->gain          = hx711.gain;
	response->rate          = hx711.rate;

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}




bool handle_weight_callback(void) {
	return handle_callback_value_callback(&callback_value_weight, FID_CALLBACK_WEIGHT);
}

void communication_tick(void) {
	communication_callback_tick();
}

void communication_init(void) {
	callback_value_init(&callback_value_weight, hx711_get_weight);;

	communication_callback_init();
}
