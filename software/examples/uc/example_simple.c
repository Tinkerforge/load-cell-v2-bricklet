// This example is not self-contained.
// It requires usage of the example driver specific to your platform.
// See the HAL documentation.

#include "src/bindings/hal_common.h"
#include "src/bindings/bricklet_load_cell_v2.h"

void check(int rc, const char *msg);
void example_setup(TF_HAL *hal);
void example_loop(TF_HAL *hal);

static TF_LoadCellV2 lc;

void example_setup(TF_HAL *hal) {
	// Create device object
	check(tf_load_cell_v2_create(&lc, NULL, hal), "create device object");

	// Get current weight
	int32_t weight;
	check(tf_load_cell_v2_get_weight(&lc, &weight), "get weight");

	tf_hal_printf("Weight: %I32d g\n", weight);
}

void example_loop(TF_HAL *hal) {
	// Poll for callbacks
	tf_hal_callback_tick(hal, 0);
}
