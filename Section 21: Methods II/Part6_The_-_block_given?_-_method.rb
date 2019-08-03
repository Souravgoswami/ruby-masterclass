#!/usr/bin/ruby -w
# Encoding: UTF-8
# Fri Aug  2 23:30:19 2019
# ruby 2.7.0
# PART 6

# The block_given? method can be used returns
# true if the method was given a block before calling
# false if not!

def x
	block_given?
end

puts(x { })
puts(x do end)
puts(x)

# While yielding or calling a block
# We get LocalJumpError if no block is given
# But we can prevent that behaviour

def y
	if block_given?
		yield('Block Given')
		return 'Block Given'
	else
		'No Block Given'
	end
end

p y
p y { }
