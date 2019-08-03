#!/usr/bin/ruby -w
# Encoding: UTF-8
# Fri Aug  2 23:30:19 2019
# ruby 2.7.0
# PART 9

# The method method returns Method class
a = method(:puts)

a.call('Hey!')
a === 'There...'
p a.owner    # returns the owner of the puts method

p method(:to_s).owner
p Object.method(:to_s).owner
p method(:method).owner

# This is yet another way to call a method...
[1,2,3,4].map(&Method.method(:puts))

# Let's take an Array, and call method + if the item is odd, or call the - method
# Both with 1
p [1,2,3,4].map.with_index { |x| x.method(x.odd? ? :+ : :-).call(1) }
