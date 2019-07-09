#!/usr/bin/ruby -w
# PART 5

# The size and length methods can be used to count the size of the Array:
a = Array.new(5, &:itself)                                                       # => [0, 1, 2, 3, 4]
p a.size                                                                         # => 5
p a.length                                                                       # => 5

# The count method (like strings) can accept a block, and count the true
# values in the block. Without a block, it behaves like size / length method.
p a.count { |i| i.odd? }                                                         # => 2
p a.count(&:odd?)                                                                # => 2
p a.count { true }                                                               # => 5
p a.count { false }                                                              # => 0
p a.count                                                                        # => 5

# Count can also accept arguments:
a = [true, false, true, false, 2, 1, 0]                                          # => [true, false, true, false, 2, 1, 0]
p a.count(true)                                                                  # => 2
p a.count { |i| not(i) }                                                         # => 2
