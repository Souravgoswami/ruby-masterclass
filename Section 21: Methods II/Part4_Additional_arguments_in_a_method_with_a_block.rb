#!/usr/bin/ruby -w
# Encoding: UTF-8
# Fri Aug  2 23:30:19 2019
# ruby 2.7.0
# PART 4

# A method can also accept arguments with a block. For example:
ary = Array(1..9)
ary.each_slice(2) { |x| p x }

puts ?- * 10

# Let's create a method like the above
def custom_slice(ary, n, &block)
	i, ary_size = -2, ary.size
	yield([ary[i], ary[i.next]].compact) while (i += 2) < ary_size
end

custom_slice(ary, 2) { |x| p x }

# let's create one tap method
p ary

p ary.tap(&:pop)
p ary

def tap(object)
	yield(object)
	object
end
puts ?= * 10
p tap(ary) { |x| x.pop }
p ary

puts ?= * 10
# We can also pass a block like this
p tap(ary, &:pop)
p ary
