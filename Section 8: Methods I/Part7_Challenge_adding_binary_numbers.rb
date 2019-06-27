#!/usr/bin/ruby -w
# Adding binary numbers

define_method(:adder) { |a, b| a.to_s.to_i(2).+(b.to_s.to_i(2)).to_s(2).to_i }

p adder(1010, 10)    # => 1100

=begin
	1010
	+  10
	------
	1100
=end

p adder(1000 + 1, '10')    # => 1010

=begin
	1001
	+   10
	-------
	1011
=end

puts adder(1000, 1).to_s.rjust(8, '0')
puts adder(1000, 1).to_s.then { |x| '0' * (8 - x.length).then { |y| y < 0 ? 0 : y } + x }
