#!/bin/sh
# Connects to localhost:4223 by default, use --host and --port to change this

uid=XYZ # Change XYZ to the UID of your Load Cell Bricklet 2.0

# Handle incoming weight callbacks
tinkerforge dispatch load-cell-v2-bricklet $uid weight &

# Configure threshold for weight "greater than 200 g"
# with a debounce period of 1s (1000ms)
tinkerforge call load-cell-v2-bricklet $uid set-weight-callback-configuration 1000 false threshold-option-greater 200 0

echo "Press key to exit"; read dummy

kill -- -$$ # Stop callback dispatch in background
