#!/usr/bin/ruby -w
# PART 8
# In general, | and & also do have precedence:
puts true | true & false & true
puts (true | true) & (false & true)

# puts 7 < 8 | 5 > Math::PI & 'hello'.eql?('hi') & 9 != 8    # NoMethodError, because Ruby thinks we are calling & method on Float (Math::PI)
# Use this instead!
puts (7 < 8) | (5 > Math::PI) & ('hello'.eql?('hi') & 9 != 8)    # STDOUT => true

# Just like the arithmatic methods, | and & have precedence too!
# Be careful when you work with them.
