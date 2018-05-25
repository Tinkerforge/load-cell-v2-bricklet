Imports System
Imports Tinkerforge

Module ExampleCallback
    Const HOST As String = "localhost"
    Const PORT As Integer = 4223
    Const UID As String = "XYZ" ' Change XYZ to the UID of your Load Cell Bricklet 2.0

    ' Callback subroutine for weight callback
    Sub WeightCB(ByVal sender As BrickletLoadCellV2, ByVal weight As Integer)
        Console.WriteLine("Weight: " + weight.ToString() + " g")
    End Sub

    Sub Main()
        Dim ipcon As New IPConnection() ' Create IP connection
        Dim lc As New BrickletLoadCellV2(UID, ipcon) ' Create device object

        ipcon.Connect(HOST, PORT) ' Connect to brickd
        ' Don't use device before ipcon is connected

        ' Register weight callback to subroutine WeightCB
        AddHandler lc.WeightCallback, AddressOf WeightCB

        ' Set period for weight callback to 1s (1000ms) without a threshold
        lc.SetWeightCallbackConfiguration(1000, False, "x"C, 0, 0)

        Console.WriteLine("Press key to exit")
        Console.ReadLine()
        ipcon.Disconnect()
    End Sub
End Module
