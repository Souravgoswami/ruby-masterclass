#!/usr/bin/ruby -w
# Encoding: UTF-8
# Fri Aug  2 23:30:19 2019
# ruby 2.7.0
# PART 2

# As we have seen there are two kinds of blocks.
# `{ }' block and `do end' block

# When we call a block from a method we
# send the control to the block. Then 
# We get back the values returned from the block
# We can pass a block to a method...
# And there are two ways to do that

# Using the & syntax
def meth1(&block)
	p block.class
	# We call the block and return whatever the block yields
	block.call('Hello world')
end

p meth1 { }
p meth1 { |x| puts x }
p meth1 { |y| y }

# Did you notice anything similar to the then method?
p 5.then { |x| x.next.to_s }

# Let's define a method called custom_then1 on all objects!
define_method(:custom_then) { |&block| block.call(self) }

p 5.custom_then { |x| x.next.to_s }
p 'Hello world'.custom_then { |x| x.each_char.map(&:next).join }

# We can also call a block with &:method syntax
p [1,2,3,4].custom_then(&:pop)
