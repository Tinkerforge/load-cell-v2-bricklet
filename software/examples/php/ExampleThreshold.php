<?php

require_once('Tinkerforge/IPConnection.php');
require_once('Tinkerforge/BrickletLoadCellV2.php');

use Tinkerforge\IPConnection;
use Tinkerforge\BrickletLoadCellV2;

const HOST = 'localhost';
const PORT = 4223;
const UID = 'XYZ'; // Change XYZ to the UID of your Load Cell Bricklet 2.0

// Callback function for weight callback
function cb_weight($weight)
{
    echo "Weight: $weight g\n";
}

$ipcon = new IPConnection(); // Create IP connection
$lc = new BrickletLoadCellV2(UID, $ipcon); // Create device object

$ipcon->connect(HOST, PORT); // Connect to brickd
// Don't use device before ipcon is connected

// Register weight callback to function cb_weight
$lc->registerCallback(BrickletLoadCellV2::CALLBACK_WEIGHT, 'cb_weight');

// Configure threshold for weight "greater than 200 g"
// with a debounce period of 1s (1000ms)
$lc->setWeightCallbackConfiguration(1000, FALSE, '>', 200, 0);

echo "Press ctrl+c to exit\n";
$ipcon->dispatchCallbacks(-1); // Dispatch callbacks forever

?>
