#!/usr/bin/ruby -w
# PART 3

# The sum method is a simple method
# It adds up all the array elements together
a = Array.new(10, &:next)                       # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
p a.sum                                         # => 55

p Array.new(1_000_000, &:next).sum              # => 500000500000
