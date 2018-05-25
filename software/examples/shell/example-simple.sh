#!/bin/sh
# Connects to localhost:4223 by default, use --host and --port to change this

uid=XYZ # Change XYZ to the UID of your Load Cell Bricklet 2.0

# Get current weight
tinkerforge call load-cell-v2-bricklet $uid get-weight
