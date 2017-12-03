#!/usr/bin/env ruby

# You come across an experimental new kind of memory stored on an infinite two-dimensional grid.
#
# Each square on the grid is allocated in a spiral pattern starting at a location marked 1 and then counting up while spiraling outward.
# For example, the first few squares are allocated like this:
#
# 17  16  15  14  13
# 18   5   4   3  12
# 19   6   1   2  11
# 20   7   8   9  10
# 21  22  23---> ...
#
# While this is very space-efficient (no squares are skipped), requested data must be carried back to square 1 (the location of the only access port for this memory system) by programs that can only move up, down, left, or right.
# They always take the shortest path: the Manhattan Distance between the location of the data and square 1.
#
# For example:
#
# Data from square 1 is carried 0 steps, since it's at the access port.
# Data from square 12 is carried 3 steps, such as: down, left, left.
# Data from square 23 is carried only 2 steps: up twice.
# Data from square 1024 must be carried 31 steps.
# How many steps are required to carry the data from the square identified in your puzzle input all the way to the access port?

input = ARGV.first.to_i

# 1   2 3 4 5 6 7 8 9   10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
# 0   1 2 1 2 1 2 1 2   3  2  3  4  3  2  3  4  3  2  3  4  3  2  3  4

# 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49   50
# 5  4  3  4  5  6  5  4  3  4  5  6  5  4  3  4  5  6  5  4  3  4  5  6    7

if input == 1
  puts 0
  exit
end

square = 2
layer = 2
layer_size = 8
loop do

  puts "BEGIN Layer #{layer}"
  lfd = 2 * layer - 3 # Layer's first digit
  puts "Group starting digit: #{lfd}"

  group_min = layer - 1
  group_max = lfd + 1
  puts "Values range between #{group_min} and #{group_max}"

  # Loop through squares of this layer
  dir = 'down'
  distance = lfd
  layer_size.times do
    puts "Square #{square} has distance #{distance}"
    exit if square == input
    square += 1
    dir = 'up' if distance == group_min
    dir = 'down' if distance == group_max
    distance += dir == 'up' ? 1 : -1
  end
  puts "END Layer #{layer}"

  layer += 1
  layer_size += 8
end
