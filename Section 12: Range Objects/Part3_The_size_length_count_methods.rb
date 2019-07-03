#!/usr/bin/ruby -w
# PART 3

# The max method returns the maximum value
p (1..1000).max                                             # => 1000
p ('a'..'zzzz').max                                         # => "zzzz"

# The min method returns the minimum value
p (1..1000).min                                             # => 1
p ('A'...'z').min    # A has minimum ASCII in 'A' to 'z'    # => "A"
p 'A'.ord                                                   # => 65

# The minmax method returns an array consisting of the
# min and max elements:
a = (1..1000)                                               # => 1..1000
p [a.min, a.max]                                            # => [1, 1000]
p a.minmax                                                  # => [1, 1000]
