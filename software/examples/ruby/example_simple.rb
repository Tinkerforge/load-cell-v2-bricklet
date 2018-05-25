#!/usr/bin/env ruby
# -*- ruby encoding: utf-8 -*-

require 'tinkerforge/ip_connection'
require 'tinkerforge/bricklet_load_cell_v2'

include Tinkerforge

HOST = 'localhost'
PORT = 4223
UID = 'XYZ' # Change XYZ to the UID of your Load Cell Bricklet 2.0

ipcon = IPConnection.new # Create IP connection
lc = BrickletLoadCellV2.new UID, ipcon # Create device object

ipcon.connect HOST, PORT # Connect to brickd
# Don't use device before ipcon is connected

# Get current weight
weight = lc.get_weight
puts "Weight: #{weight} g"

puts 'Press key to exit'
$stdin.gets
ipcon.disconnect
