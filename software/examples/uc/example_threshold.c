

#include "bindings/hal_common.h"
#include "bindings/bricklet_load_cell_v2.h"

#define UID "XYZ" // Change XYZ to the UID of your Load Cell Bricklet 2.0

void check(int rc, const char* msg);



// Callback function for weight callback
void weight_handler(TF_LoadCellV2 *device, int32_t weight, void *user_data) {
	(void)device; (void)user_data; // avoid unused parameter warning

	tf_hal_printf("Weight: %d g\n", weight);
}


TF_LoadCellV2 lc;

void example_setup(TF_HalContext *hal) {
	// Create device object
	check(tf_load_cell_v2_create(&lc, UID, hal), "create device object");


	// Register weight callback to function weight_handler
	tf_load_cell_v2_register_weight_callback(&lc,
	                                        weight_handler,
	                                        NULL);

	// Configure threshold for weight "greater than 200 g"
	// with a debounce period of 1s (1000ms)
	tf_load_cell_v2_set_weight_callback_configuration(&lc, 1000, false, '>', 200, 0);

}

void example_loop(TF_HalContext *hal) {
	// Poll for callbacks
	tf_hal_callback_tick(hal, 0);
}
