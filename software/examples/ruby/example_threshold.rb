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

# Register weight callback
lc.register_callback(BrickletLoadCellV2::CALLBACK_WEIGHT) do |weight|
  puts "Weight: #{weight} g"
end

# Configure threshold for weight "greater than 200 g"
# with a debounce period of 1s (1000ms)
lc.set_weight_callback_configuration 1000, false, '>', 200, 0

puts 'Press key to exit'
$stdin.gets
ipcon.disconnect
