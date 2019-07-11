#!/usr/bin/ruby -w
# PART 7

# The partition method:
ary = Array(1..20)                                     # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
odd, even = ary.partition { |x| x.odd? }               # => [[1, 3, 5, 7, 9, 11, 13, 15, 17, 19], [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]]
p odd                                                  # => [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]
p even                                                 # => [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]

# Similarly
p ary.partition(&:odd?)                                # => [[1, 3, 5, 7, 9, 11, 13, 15, 17, 19], [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]]

# let's sort the array with words that has a
ary = %w\once upon a time in a galaxy far far away\    # => ["once", "upon", "a", "time", "in", "a", "galaxy", "far", "far", "away"]
p ary.partition { |x| x.include?('a') }                # => [["a", "a", "galaxy", "far", "far", "away"], ["once", "upon", "time", "in"]]
