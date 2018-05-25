using System;
using Tinkerforge;

class Example
{
	private static string HOST = "localhost";
	private static int PORT = 4223;
	private static string UID = "XYZ"; // Change XYZ to the UID of your Load Cell Bricklet 2.0

	// Callback function for weight callback
	static void WeightCB(BrickletLoadCellV2 sender, int weight)
	{
		Console.WriteLine("Weight: " + weight + " g");
	}

	static void Main()
	{
		IPConnection ipcon = new IPConnection(); // Create IP connection
		BrickletLoadCellV2 lc = new BrickletLoadCellV2(UID, ipcon); // Create device object

		ipcon.Connect(HOST, PORT); // Connect to brickd
		// Don't use device before ipcon is connected

		// Register weight callback to function WeightCB
		lc.WeightCallback += WeightCB;

		// Configure threshold for weight "greater than 200 g"
		// with a debounce period of 1s (1000ms)
		lc.SetWeightCallbackConfiguration(1000, false, '>', 200, 0);

		Console.WriteLine("Press enter to exit");
		Console.ReadLine();
		ipcon.Disconnect();
	}
}
