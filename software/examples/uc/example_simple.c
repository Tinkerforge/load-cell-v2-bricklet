#include "bindings/hal_common.h"
#include "bindings/bricklet_load_cell_v2.h"

#define UID "XYZ" // Change XYZ to the UID of your Load Cell Bricklet 2.0

void check(int rc, const char* msg);

TF_LoadCellV2 lc;

void example_setup(TF_HalContext *hal) {
	// Create device object
	check(tf_load_cell_v2_create(&lc, UID, hal), "create device object");


	// Get current weight
	int32_t weight;
	check(tf_load_cell_v2_get_weight(&lc, &weight), "get weight");

	tf_hal_printf("Weight: %d g\n", weight);

}

void example_loop(TF_HalContext *hal) {
	// Poll for callbacks
	tf_hal_callback_tick(hal, 0);
}
