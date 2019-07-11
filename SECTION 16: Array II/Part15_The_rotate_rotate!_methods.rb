#!/usr/bin/ruby -w
# PART 15

# The rotate method rotates an array:
a = (1..10).to_a                         # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
p a.rotate                               # => [2, 3, 4, 5, 6, 7, 8, 9, 10, 1]
p a.rotate.rotate                        # => [3, 4, 5, 6, 7, 8, 9, 10, 1, 2]
p a.rotate(2)                            # => [3, 4, 5, 6, 7, 8, 9, 10, 1, 2]

p a.rotate(-1)                           # => [10, 1, 2, 3, 4, 5, 6, 7, 8, 9]
p a.rotate(-2)                           # => [9, 10, 1, 2, 3, 4, 5, 6, 7, 8]

# There's also the rotate! method
p a                                      # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
p a.rotate!                              # => [2, 3, 4, 5, 6, 7, 8, 9, 10, 1]
p a                                      # => [2, 3, 4, 5, 6, 7, 8, 9, 10, 1]
