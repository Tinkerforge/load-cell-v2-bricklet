function octave_example_threshold()
    more off;

    HOST = "localhost";
    PORT = 4223;
    UID = "XYZ"; % Change XYZ to the UID of your Load Cell Bricklet 2.0

    ipcon = javaObject("com.tinkerforge.IPConnection"); % Create IP connection
    lc = javaObject("com.tinkerforge.BrickletLoadCellV2", UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Register weight callback to function cb_weight
    lc.addWeightCallback(@cb_weight);

    % Configure threshold for weight "greater than 200 g"
    % with a debounce period of 1s (1000ms)
    lc.setWeightCallbackConfiguration(1000, false, ">", 200, 0);

    input("Press key to exit\n", "s");
    ipcon.disconnect();
end

% Callback function for weight callback
function cb_weight(e)
    fprintf("Weight: %d g\n", e.weight);
end
