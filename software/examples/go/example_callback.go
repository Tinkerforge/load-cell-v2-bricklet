package main

import (
	"fmt"
	"github.com/tinkerforge/go-api-bindings/ipconnection"
	"github.com/tinkerforge/go-api-bindings/load_cell_v2_bricklet"
)

const ADDR string = "localhost:4223"
const UID string = "XYZ" // Change XYZ to the UID of your Load Cell Bricklet 2.0.

func main() {
	ipcon := ipconnection.New()
	defer ipcon.Close()
	lc, _ := load_cell_v2_bricklet.New(UID, &ipcon) // Create device object.

	ipcon.Connect(ADDR) // Connect to brickd.
	defer ipcon.Disconnect()
	// Don't use device before ipcon is connected.

	lc.RegisterWeightCallback(func(weight int32) {
		fmt.Printf("Weight: %d g\n", weight)
	})

	// Set period for weight callback to 1s (1000ms) without a threshold.
	lc.SetWeightCallbackConfiguration(1000, false, 'x', 0, 0)

	fmt.Print("Press enter to exit.")
	fmt.Scanln()

}
