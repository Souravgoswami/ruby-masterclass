#!/usr/bin/ruby -w
# PART 20

# The sort method on array with <=> can
# produce various results:
a = [1, 5, 3, 2, 4]                        # => [1, 5, 3, 2, 4]
p a.sort                                   # => [1, 2, 3, 4, 5]
p a.sort { |x, y| x <=> y }                # => [1, 2, 3, 4, 5]
p a.sort { |x, y| y <=> x }                # => [5, 4, 3, 2, 1]
