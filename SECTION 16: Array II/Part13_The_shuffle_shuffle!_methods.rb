#!/usr/bin/ruby -w
# PART 13

# The shuffle method rearranges all the items of the array.
# Say you have a deck of cards. You shuffle them randomly.
# Note that there's always one possibility of not getting the
# deck shuffled at all!
# That said, [1, 2].shuffle can return either [2, 1] or [1, 2] itself!
[1, 2].shuffle                                                            # => [2, 1]

a = Array.new(10, &:next)                                                 # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
p a                                                                       # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
p a.shuffle                                                               # => [1, 2, 3, 10, 7, 5, 6, 8, 4, 9]

# The bang method does the same job, except it modifies the
# original array without modifying the object_id
p a.shuffle!                                                              # => [5, 1, 6, 4, 9, 3, 7, 8, 2, 10]
p a                                                                       # => [5, 1, 6, 4, 9, 3, 7, 8, 2, 10]
