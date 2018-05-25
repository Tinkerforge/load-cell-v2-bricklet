#!/usr/bin/perl

use strict;
use Tinkerforge::IPConnection;
use Tinkerforge::BrickletLoadCellV2;

use constant HOST => 'localhost';
use constant PORT => 4223;
use constant UID => 'XYZ'; # Change XYZ to the UID of your Load Cell Bricklet 2.0

my $ipcon = Tinkerforge::IPConnection->new(); # Create IP connection
my $lc = Tinkerforge::BrickletLoadCellV2->new(&UID, $ipcon); # Create device object

$ipcon->connect(&HOST, &PORT); # Connect to brickd
# Don't use device before ipcon is connected

# Get current weight
my $weight = $lc->get_weight();
print "Weight: $weight g\n";

print "Press key to exit\n";
<STDIN>;
$ipcon->disconnect();
