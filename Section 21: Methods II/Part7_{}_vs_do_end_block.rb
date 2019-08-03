#!/usr/bin/ruby -w
# Encoding: UTF-8
# Fri Aug  2 23:30:19 2019
# ruby 2.7.0
# PART 7

# There are two confusing block! { } and do end!
# It's time to demystify them!
# The do end block has low priority

# For example, here you are passing block to p rather than to map:
p [1,2,3].map do |x| Math.log2(x) end

# To prevent that you can use () after p method:
p([1,2,3].map do |x| Math.log2(x) end)

# Or
p ([1,2,3].map do |x| Math.log2(x) end)

# But there's the { } block that has the higher precidence:
p [1,2,3].map { |x| Math.log2(x) }
# Or you can also do:
p [1,2,3].map(&Math.method(:log2))

# Let's see with a method:
def x(stdout = true)
	block_given?.tap { |x| puts x if stdout }
end

def y(stdout = true)
	block_given?.tap { |x| puts x if stdout }
end

p x(false) { }
p x(false) do end

x { }
x do end

# So be careful when dealing with this next time!
