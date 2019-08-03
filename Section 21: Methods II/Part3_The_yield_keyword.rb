#!/usr/bin/ruby -w
# Encoding: UTF-8
# Fri Aug  2 23:30:19 2019
# ruby 2.7.0
# PART 3

# The yield keyword 
# The block.call can be replaced with the yield keyword
def meth1
	yield('Hi World')
	'Something!!'
end

# As we can see yield has passed the control to
# the block. Then it returns a String 'Something'
# The yield method will contain the value
# returned from the block. 
p meth1 { |x| p x.next }

# Another example:
def meth2
	yield('Once upon a time in a galaxy far far away...')
end

meth2(&method(:puts))

# Let's build our custom tap method:
def custom_tap(object)
	yield(object)
	object
end

ary = Array(1..5)

p ary.tap(&:pop)
# Here the method first yields the memory location of the array
# Then it calls the pop method on the array
# Then it returns the array and not the value that pop yielded (in this case 5)

# So let's do it with our custom_tap
ary.replace(Array(1..5))
p custom_tap(ary) { |x| x.pop }
