/* load-cell-v2-bricklet
 * Copyright (C) 2018 Olaf Lüke <olaf@tinkerforge.com>
 * Copyright (C) 2018 Ishraq Ibne Ashraf <ishraq@tinkerforge.com>
 *
 * communication.h: TFP protocol message handling
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

#ifndef COMMUNICATION_H
#define COMMUNICATION_H

#include <stdint.h>
#include <stdbool.h>

#include "bricklib2/protocols/tfp/tfp.h"
#include "bricklib2/bootloader/bootloader.h"

// Default functions
BootloaderHandleMessageResponse handle_message(const void *data, void *response);
void communication_tick(void);
void communication_init(void);

// Constants
#define LOAD_CELL_V2_THRESHOLD_OPTION_OFF 'x'
#define LOAD_CELL_V2_THRESHOLD_OPTION_OUTSIDE 'o'
#define LOAD_CELL_V2_THRESHOLD_OPTION_INSIDE 'i'
#define LOAD_CELL_V2_THRESHOLD_OPTION_SMALLER '<'
#define LOAD_CELL_V2_THRESHOLD_OPTION_GREATER '>'

#define LOAD_CELL_V2_INFO_LED_CONFIGURATION_OFF 0
#define LOAD_CELL_V2_INFO_LED_CONFIGURATION_ON 1
#define LOAD_CELL_V2_INFO_LED_CONFIGURATION_HEARTBEAT 2

#define LOAD_CELL_V2_RATE_10HZ 0
#define LOAD_CELL_V2_RATE_80HZ 1

#define LOAD_CELL_V2_GAIN_128X 0
#define LOAD_CELL_V2_GAIN_64X 1
#define LOAD_CELL_V2_GAIN_32X 2

#define LOAD_CELL_V2_BOOTLOADER_MODE_BOOTLOADER 0
#define LOAD_CELL_V2_BOOTLOADER_MODE_FIRMWARE 1
#define LOAD_CELL_V2_BOOTLOADER_MODE_BOOTLOADER_WAIT_FOR_REBOOT 2
#define LOAD_CELL_V2_BOOTLOADER_MODE_FIRMWARE_WAIT_FOR_REBOOT 3
#define LOAD_CELL_V2_BOOTLOADER_MODE_FIRMWARE_WAIT_FOR_ERASE_AND_REBOOT 4

#define LOAD_CELL_V2_BOOTLOADER_STATUS_OK 0
#define LOAD_CELL_V2_BOOTLOADER_STATUS_INVALID_MODE 1
#define LOAD_CELL_V2_BOOTLOADER_STATUS_NO_CHANGE 2
#define LOAD_CELL_V2_BOOTLOADER_STATUS_ENTRY_FUNCTION_NOT_PRESENT 3
#define LOAD_CELL_V2_BOOTLOADER_STATUS_DEVICE_IDENTIFIER_INCORRECT 4
#define LOAD_CELL_V2_BOOTLOADER_STATUS_CRC_MISMATCH 5

#define LOAD_CELL_V2_STATUS_LED_CONFIG_OFF 0
#define LOAD_CELL_V2_STATUS_LED_CONFIG_ON 1
#define LOAD_CELL_V2_STATUS_LED_CONFIG_SHOW_HEARTBEAT 2
#define LOAD_CELL_V2_STATUS_LED_CONFIG_SHOW_STATUS 3

// Function and callback IDs and structs
#define FID_GET_WEIGHT 1
#define FID_SET_WEIGHT_CALLBACK_CONFIGURATION 2
#define FID_GET_WEIGHT_CALLBACK_CONFIGURATION 3
#define FID_SET_MOVING_AVERAGE 5
#define FID_GET_MOVING_AVERAGE 6
#define FID_SET_INFO_LED_CONFIGURATION 7
#define FID_GET_INFO_LED_CONFIGURATION 8
#define FID_CALIBRATE 9
#define FID_TARE 10
#define FID_SET_CONFIGURATION 11
#define FID_GET_CONFIGURATION 12

#define FID_CALLBACK_WEIGHT 4

typedef struct {
	TFPMessageHeader header;
	uint16_t average;
} __attribute__((__packed__)) SetMovingAverage;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) GetMovingAverage;

typedef struct {
	TFPMessageHeader header;
	uint16_t average;
} __attribute__((__packed__)) GetMovingAverage_Response;

typedef struct {
	TFPMessageHeader header;
	uint8_t configuration;
} __attribute__((__packed__)) SetInfoLEDConfiguration;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) GetInfoLEDConfiguration;

typedef struct {
	TFPMessageHeader header;
	uint8_t configuration;
} __attribute__((__packed__)) GetInfoLEDConfiguration_Response;

typedef struct {
	TFPMessageHeader header;
	uint32_t weight;
} __attribute__((__packed__)) Calibrate;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) Tare;

typedef struct {
	TFPMessageHeader header;
	uint8_t rate;
	uint8_t gain;
} __attribute__((__packed__)) SetConfiguration;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) GetConfiguration;

typedef struct {
	TFPMessageHeader header;
	uint8_t rate;
	uint8_t gain;
} __attribute__((__packed__)) GetConfiguration_Response;


// Function prototypes
BootloaderHandleMessageResponse set_moving_average(const SetMovingAverage *data);
BootloaderHandleMessageResponse get_moving_average(const GetMovingAverage *data, GetMovingAverage_Response *response);
BootloaderHandleMessageResponse set_info_led_configuration(const SetInfoLEDConfiguration *data);
BootloaderHandleMessageResponse get_info_led_configuration(const GetInfoLEDConfiguration *data, GetInfoLEDConfiguration_Response *response);
BootloaderHandleMessageResponse calibrate(const Calibrate *data);
BootloaderHandleMessageResponse tare(const Tare *data);
BootloaderHandleMessageResponse set_configuration(const SetConfiguration *data);
BootloaderHandleMessageResponse get_configuration(const GetConfiguration *data, GetConfiguration_Response *response);

// Callbacks
bool handle_weight_callback(void);

#define COMMUNICATION_CALLBACK_TICK_WAIT_MS 1
#define COMMUNICATION_CALLBACK_HANDLER_NUM 1
#define COMMUNICATION_CALLBACK_LIST_INIT \
	handle_weight_callback, \


#endif
