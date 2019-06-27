#!/usr/bin/ruby -w
# The define_method method can be used instead of def ... end
# But it can't have an implicit call of the super method - which we will
# See later

def power_of_2?(a)
	return Math.log2(a).then { |x| x == x.to_i}
end

p power_of_2?(2)    # => true
p power_of_2?(4)    # => true
p power_of_2?(1024)    # => true
p power_of_2?(33)    # => false
p power_of_2?(148)    # => false

define_method(:p2?) { |a| return Math.log2(a).then { |x| x == x.to_i } }

puts '-' * 50
p p2?(1)    # => true
p p2?(4)    # => true
p p2?(1024)    # => true
p p2?(33)    # => false
p p2?(148)    # => false
