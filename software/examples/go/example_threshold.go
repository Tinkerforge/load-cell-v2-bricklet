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

	// Configure threshold for weight "greater than 200 g"
	// with a debounce period of 1s (1000ms).
	lc.SetWeightCallbackConfiguration(1000, false, '>', 200, 0)

	fmt.Print("Press enter to exit.")
	fmt.Scanln()

}
