#!/usr/bin/ruby -w
# PART 3

# Anything in Ruby except false and nil are truthy!
# nil and false are falsey.
# So for example:

puts 'hi' if true
puts 'hi' if 1
puts 'hi' if !nil
puts 'hi' if not(nil)
puts 'hi' if !false
puts 'hi' if ''

puts '-' * 10

puts 'hi' if false
puts 'hi' if nil
puts 'hi' if !1

puts '-' * 10


a = 'hello'
puts !a
puts !!a

puts :hi if a
puts :hi if !a
