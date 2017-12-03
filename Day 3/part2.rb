#!/usr/bin/env ruby

# As a stress test on the system, the programs here clear the grid and then store the value 1 in square 1.
# Then, in the same allocation order as shown above, they store the sum of the values in all adjacent squares, including diagonals.
#
# So, the first few squares' values are chosen as follows:
#
# Square 1 starts with the value 1.
# Square 2 has only one adjacent filled square (with value 1), so it also stores 1.
# Square 3 has both of the above squares as neighbors and stores the sum of their values, 2.
# Square 4 has all three of the aforementioned squares as neighbors and stores the sum of their values, 4.
# Square 5 only has the first and fourth squares as neighbors, so it gets the value 5.
# Once a square is written, its value does not change. Therefore, the first few squares would receive the following values:
#
# 147  142  133  122   59
# 304    5    4    2   57
# 330   10    1    1   54
# 351   11   23   25   26
# 362  747  806--->   ...
# What is the first value written that is larger than your puzzle input?

input = ARGV.first.to_i

grid = {
  :'0,0' => 1
}
x = 1
y = 0
grid_dir = 'r'

square = 2
layer = 2
squares_in_layer = 8
loop do

  puts "BEGIN Layer #{layer}"
  lfd = 2 * layer - 3 # Layer's first digit

  layer_min = layer - 1
  layer_max = lfd + 1

  # Loop through squares of this layer
  dir = 'down'
  distance = lfd
  squares_in_layer.times do |i|

    # Calculate sum of adjecent squares (soa)
    soa = 0
    soa += grid[:"#{x+1},#{y}"] || 0
    soa += grid[:"#{x+1},#{y+1}"] || 0
    soa += grid[:"#{x},#{y+1}"] || 0
    soa += grid[:"#{x-1},#{y+1}"] || 0
    soa += grid[:"#{x-1},#{y}"] || 0
    soa += grid[:"#{x-1},#{y-1}"] || 0
    soa += grid[:"#{x},#{y-1}"] || 0
    soa += grid[:"#{x+1},#{y-1}"] || 0


    puts "Square #{square} (#{x},#{y}) soa is #{soa}"
    grid[:"#{x},#{y}"] = soa # Store value in grid

    exit if (soa > input)

    if i.zero? || distance == layer_max && grid_dir != 'r'
      case grid_dir
        when 'r'
          grid_dir = 'u'
        when 'u'
          grid_dir = 'l'
        when 'l'
          grid_dir = 'd'
        when 'd'
          grid_dir = 'r'
      end
      puts "changed dir to #{grid_dir}"
    end

    square += 1
    dir = 'up' if distance == layer_min
    dir = 'down' if distance == layer_max
    distance += dir == 'up' ? 1 : -1

    case grid_dir
      when 'r'
        x += 1
      when 'u'
        y += 1
      when 'l'
        x += -1
      when 'd'
        y += -1
    end
  end
  puts "END Layer #{layer}"

  layer += 1
  squares_in_layer += 8
end

