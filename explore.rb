#!/usr/bin/env ruby

require './app'

instructions = File.read('./instructions.txt')

mc = MissionControl.new(instructions)
mc.execute!