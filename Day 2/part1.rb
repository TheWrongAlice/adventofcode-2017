#!/usr/bin/env ruby

checksum = 0
File.open('input.txt').each do |line_raw|
  numbers_on_line = []
  line_raw.delete("\n").split("\t").each do |number|
    numbers_on_line << number.to_i
  end
  checksum += numbers_on_line.max - numbers_on_line.min
end
puts checksum
