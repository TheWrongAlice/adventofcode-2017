#!/usr/bin/env ruby

checksum = 0
File.open('input.txt').each do |line_raw|
  numbers_on_line = []
  line_raw.delete("\n").split("\t").each do |number|
    numbers_on_line << number.to_i
  end

  is_even = false
  numbers_on_line.each_with_index do |a, index_a|
    numbers_on_line.each_with_index do |b, index_b|
      next if index_a == index_b # Don't divide by itself

      is_even = (a.to_f % b.to_f).zero?

      if is_even
        checksum += (a / b)
        break
      end
    end
    break if is_even
  end

end
puts checksum
