#!/usr/bin/ruby -w
# PART 4

outer_loop, inner_loop = 10, 10

# Inefficient 4 liners
# outer_loop.times do |x|
# 	x += 1
# 	inner_loop.times { |z| puts "#{x}x#{z += 1} = #{x * z}" }
# end

# Inefficient 1 liners
outer_loop.times { |x| x.next.tap { |y| inner_loop.times { |z| puts "#{y} x #{z += 1} = #{y * z}" } } }

# We'll see that puts in a bigger loops slows everything down! We can use map iterator which we haven't discussed yet.
# The following code requires some memory, but works faster
# In future, we will see how the following code works
# Efficient 1 liners
# puts (1..outer_loop).map { |i| (1..inner_loop).map { |j| "#{i}x#{j} = #{i * j}" } }
