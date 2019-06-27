#!/usr/bin/ruby -w

# Here's a method that detects if a given number is power of 2 or not
def power_of_2?(a) Math.log2(a.to_i).then { |x| x == x.to_i } == true end

p power_of_2?(4)
p power_of_2?(5)
puts '-'  * 5

# In the above power_of_2? method we are comparing if Math.log2(a.to_i).then { |x| x == x.to_i } is true or not
# But in general, if a number is power of 2, the whole code is evaluated to true. So we compare true == true, which is true
# We can replace that. So if a the code is false, it doesn't have to check if false == true which is also false.
# So we can omit the `== true` part

define_method(:p2?) { Math.log2(a.to_i).then { |x| x == x.to_i } }

p power_of_2?(4)
p power_of_2?(5)
puts '-'  * 5

# Or
def p_2?(a) Math.log2(a).then { |x| x == x.to_i } end

p p_2?(4)
p p_2?(5)
