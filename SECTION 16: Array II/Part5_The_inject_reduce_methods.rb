#!/usr/bin/ruby -w
# PART 5

# The inject method combines all the elements
# with a binary operator
arr = Array.new(6, &:next)                                                       # => [1, 2, 3, 4, 5, 6]
p arr.inject(:*)                                                                 # => 720
# Which means 1 * 2 * 3 * 4 * 5 * 6 or 6!
# Other examples
p arr.inject(:+)                                                                 # => 21
p arr.inject(:-)                                                                 # => -19

arr2 = Array.new(6) { |i| 97.+(i).chr }                                          # => ["a", "b", "c", "d", "e", "f"]
# It also take an additional argument:
p arr2.inject('z', :concat)                                                      # => "zabcdef"

p arr2                                                                           # => ["a", "b", "c", "d", "e", "f"]
p arr2.inject(:+)                                                                # => "abcdef"
p arr2                                                                           # => ["a", "b", "c", "d", "e", "f"]

# But concat will change the elements:
arr2.inject(:concat)                                                             # => "abcdef"
p arr2                                                                           # => ["abcdef", "b", "c", "d", "e", "f"]
# Which means "a".concat("b").concat("c").concat("d").concat("e").concat("f")
# "a".concat("b") changes "a" to "ab"!

puts '-' * 10                                                                    # => nil
# The reduce method is exactly the same...
# Use either inject or reduce throughout your program... Or both!
p arr.reduce(:*)                                                                 # => 720
p arr2.reduce(:concat)                                                           # => "abcdefbcdef"

puts '-' * 10                                                                    # => nil
# reduce also takes another argument:
p arr                                                                            # => [1, 2, 3, 4, 5, 6]
p arr.reduce([]) { |arr, el| arr.push(el ** 2 + 10 * el) }                       # => [11, 24, 39, 56, 75, 96]
