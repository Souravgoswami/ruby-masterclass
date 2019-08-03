#!/usr/bin/ruby -w
# Encoding: UTF-8
# Fri Aug  2 23:30:19 2019
# ruby 2.7.0
# PART 5

# We have seen that a block is a proc object.
# We will discuss proc in the very next section.
# But here are the way you can call a block or
# proc / lambda / stabby lambda in general

def meth1(&block)
	block.call(1, 2, 3)
	block.(2, 3, 4)
	block[3, 4, 5]
	block.[](4, 5, 6)
	block.===(6, 7, 8)
	block === 5
	# But sady, the last one can call only one value at a time
end

meth1 { |x, y, z| p [x, y, z] }

