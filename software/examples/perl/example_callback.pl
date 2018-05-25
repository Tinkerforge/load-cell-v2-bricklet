#!/usr/bin/perl

use strict;
use Tinkerforge::IPConnection;
use Tinkerforge::BrickletLoadCellV2;

use constant HOST => 'localhost';
use constant PORT => 4223;
use constant UID => 'XYZ'; # Change XYZ to the UID of your Load Cell Bricklet 2.0

# Callback subroutine for weight callback
sub cb_weight
{
    my ($weight) = @_;

    print "Weight: $weight g\n";
}

my $ipcon = Tinkerforge::IPConnection->new(); # Create IP connection
my $lc = Tinkerforge::BrickletLoadCellV2->new(&UID, $ipcon); # Create device object

$ipcon->connect(&HOST, &PORT); # Connect to brickd
# Don't use device before ipcon is connected

# Register weight callback to subroutine cb_weight
$lc->register_callback($lc->CALLBACK_WEIGHT, 'cb_weight');

# Set period for weight callback to 1s (1000ms) without a threshold
$lc->set_weight_callback_configuration(1000, 0, 'x', 0, 0);

print "Press key to exit\n";
<STDIN>;
$ipcon->disconnect();
