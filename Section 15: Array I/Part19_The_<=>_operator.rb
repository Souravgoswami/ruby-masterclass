#!/usr/bin/ruby -w
# PART 19

# Consider two arrays, a and b.
# The spaceship operator returns:
# 1 if array a is bigger than array b.
# 0 if array a and array b are equal.
# -1 if array a is smaller than array b.

p [1,1] <=> [1]                             # => 1
p [2] <=> [1,2]                             # => 1
p [1] <=> [1]                               # => 0
p [1, 2] <=> [1, 2]                         # => 0
p [1] <=> [2]                               # => -1
p [1, 2] <=> [1, 3]                         # => -1

# The <=> method returns nil if the
# items can't be compared
a, b = Array(1..3), Array('a'..'d')         # => [[1, 2, 3], ["a", "b", "c", "d"]]
p a <=> b                                   # => nil
