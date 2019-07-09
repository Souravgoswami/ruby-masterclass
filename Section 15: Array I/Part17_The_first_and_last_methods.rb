#!/usr/bin/ruby -w
# PART 17

# The first method returns the first(n) objects
a = Array.new(10, &:next)                                  # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
p a.first                                                  # => 1
p a.first(3)                                               # => [1, 2, 3]

p a.last                                                   # => 10
p a.last(3)                                                # => [8, 9, 10]

a = Array.new(10) { |i| [i, i + 1, i + 2] }                # => [[0, 1, 2], [1, 2, 3], [2, 3, 4], [3, 4, 5], [4, 5, 6], [5, 6, 7], [6, 7, 8], [7, 8, 9], [8, 9, 10], [9, 10, 11]]
# bracket syntax could come in handy in such situation:
p a.map(&:last)                                            # => [2, 3, 4, 5, 6, 7, 8, 9, 10, 11]

# or just in
p a.last(3)                                                # => [[7, 8, 9], [8, 9, 10], [9, 10, 11]]
