/* load-cell-v2-bricklet
 * Copyright (C) 2018 Olaf Lüke <olaf@tinkerforge.com>
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

CallbackValue callback_value_weight;


BootloaderHandleMessageResponse handle_message(const void *message, void *response) {
	switch(tfp_get_fid_from_message(message)) {
		case FID_GET_WEIGHT: return get_callback_value(message, response, &callback_value_weight);
		case FID_SET_WEIGHT_CALLBACK_CONFIGURATION: return set_callback_value_callback_configuration(message, &callback_value_weight);
		case FID_GET_WEIGHT_CALLBACK_CONFIGURATION: return get_callback_value_callback_configuration(message, response, &callback_value_weight);
		case FID_SET_MOVING_AVERAGE: return set_moving_average(message);
		case FID_GET_MOVING_AVERAGE: return get_moving_average(message, response);
		case FID_SET_LED_CONFIGURATION: return set_led_configuration(message);
		case FID_GET_LED_CONFIGURATION: return get_led_configuration(message, response);
		case FID_CALIBRATE: return calibrate(message);
		case FID_TARE: return tare(message);
		case FID_SET_CONFIGURATION: return set_configuration(message);
		case FID_GET_CONFIGURATION: return get_configuration(message, response);
		default: return HANDLE_MESSAGE_RESPONSE_NOT_SUPPORTED;
	}
}


BootloaderHandleMessageResponse set_moving_average(const SetMovingAverage *data) {

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_moving_average(const GetMovingAverage *data, GetMovingAverage_Response *response) {
	response->header.length = sizeof(GetMovingAverage_Response);

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse set_led_configuration(const SetLEDConfiguration *data) {

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_led_configuration(const GetLEDConfiguration *data, GetLEDConfiguration_Response *response) {
	response->header.length = sizeof(GetLEDConfiguration_Response);

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse calibrate(const Calibrate *data) {

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse tare(const Tare *data) {

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse set_configuration(const SetConfiguration *data) {

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_configuration(const GetConfiguration *data, GetConfiguration_Response *response) {
	response->header.length = sizeof(GetConfiguration_Response);

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}




bool handle_weight_callback(void) {
	return handle_callback_value_callback(&callback_value_weight, FID_CALLBACK_WEIGHT);
}

void communication_tick(void) {
	communication_callback_tick();
}

void communication_init(void) {
	// TODO: Add proper functions
	callback_value_init(&callback_value_weight, NULL);;

	communication_callback_init();
}
