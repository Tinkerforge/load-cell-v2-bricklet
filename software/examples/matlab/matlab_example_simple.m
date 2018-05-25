function matlab_example_simple()
    import com.tinkerforge.IPConnection;
    import com.tinkerforge.BrickletLoadCellV2;

    HOST = 'localhost';
    PORT = 4223;
    UID = 'XYZ'; % Change XYZ to the UID of your Load Cell Bricklet 2.0

    ipcon = IPConnection(); % Create IP connection
    lc = handle(BrickletLoadCellV2(UID, ipcon), 'CallbackProperties'); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Get current weight
    weight = lc.getWeight();
    fprintf('Weight: %i g\n', weight);

    input('Press key to exit\n', 's');
    ipcon.disconnect();
end
