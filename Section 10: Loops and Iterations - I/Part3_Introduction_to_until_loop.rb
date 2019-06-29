#!/usr/bin/ruby -w
# PART 3

# Just opposite to the while loop, the until loop is iterated until a false condition is met

=begin
until false do    # the do can be ommited just like the while loop, discussed earlier
	puts 'hi'
end

puts 'You can never reach me!'
=end

a, i = 5, 0
until i == a
	puts i += 1
end

a, i = 5, 0
until i == a do puts i += 1 end

a, i = 5, 0
puts i += 1 until i == a
