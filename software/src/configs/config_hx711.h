/* load-cell-v2-bricklet
 * Copyright (C) 2018 Olaf Lüke <olaf@tinkerforge.com>
 *
 * config_hx711.h: HX711 specific configurations
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

#ifndef CONFIG_HX711_H
#define CONFIG_HX711_H

#include "xmc_gpio.h"

#define HX711_CALIBRATION_PAGE           1
#define HX711_CALIBRATION_MAGIC_POS      0
#define HX711_CALIBRATION_OFFSET_POS     1
#define HX711_CALIBRATION_MULTIPLIER_POS 2
#define HX711_CALIBRATION_DIVISOR_POS    3

#define HX711_CALIBRATION_MAGIC          0x12345678

#define HX711_LED_PIN   P0_9
#define HX711_RATE_PIN  P0_5

#define HX711_CLK_PIN   P0_8
#define HX711_DAT_PIN   P0_6


#endif
