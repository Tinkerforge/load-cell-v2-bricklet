<?php

require_once('Tinkerforge/IPConnection.php');
require_once('Tinkerforge/BrickletLoadCellV2.php');

use Tinkerforge\IPConnection;
use Tinkerforge\BrickletLoadCellV2;

const HOST = 'localhost';
const PORT = 4223;
const UID = 'XYZ'; // Change XYZ to the UID of your Load Cell Bricklet 2.0

$ipcon = new IPConnection(); // Create IP connection
$lc = new BrickletLoadCellV2(UID, $ipcon); // Create device object

$ipcon->connect(HOST, PORT); // Connect to brickd
// Don't use device before ipcon is connected

// Get current weight
$weight = $lc->getWeight();
echo "Weight: $weight g\n";

echo "Press key to exit\n";
fgetc(fopen('php://stdin', 'r'));
$ipcon->disconnect();

?>
