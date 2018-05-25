var Tinkerforge = require('tinkerforge');

var HOST = 'localhost';
var PORT = 4223;
var UID = 'XYZ'; // Change XYZ to the UID of your Load Cell Bricklet 2.0

var ipcon = new Tinkerforge.IPConnection(); // Create IP connection
var lc = new Tinkerforge.BrickletLoadCellV2(UID, ipcon); // Create device object

ipcon.connect(HOST, PORT,
    function (error) {
        console.log('Error: ' + error);
    }
); // Connect to brickd
// Don't use device before ipcon is connected

ipcon.on(Tinkerforge.IPConnection.CALLBACK_CONNECTED,
    function (connectReason) {
        // Set period for weight callback to 1s (1000ms) without a threshold
        lc.setWeightCallbackConfiguration(1000, false, 'x', 0, 0);
    }
);

// Register weight callback
lc.on(Tinkerforge.BrickletLoadCellV2.CALLBACK_WEIGHT,
    // Callback function for weight callback
    function (weight) {
        console.log('Weight: ' + weight + ' g');
    }
);

console.log('Press key to exit');
process.stdin.on('data',
    function (data) {
        ipcon.disconnect();
        process.exit(0);
    }
);
