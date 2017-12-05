#!/usr/bin/env ruby

# Now, the jumps are even stranger: after each jump, if the offset was three or more, instead decrease it by 1.
# Otherwise, increase it by 1 as before.
#
# Using this rule with the above example, the process now takes 10 steps,
# and the offset values after finding the exit are left as 2 3 2 3 -1.
#
# How many steps does it now take to reach the exit?

instructions = File.foreach('input.txt').map(&:to_i)
pos = 0

1.step do |op_count|
  start_pos = pos
  pos += instructions[pos]
  if pos == instructions.length
    puts op_count
    exit
  end
  instructions[start_pos] += (instructions[start_pos] < 3 ? 1 : -1)
end
