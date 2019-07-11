#!/usr/bin/ruby -w
# PART 8

# The clear method is just used to clear all
# the items of the array without modifying the
# memory location
a = Array.new(20, &:next)                         # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
p a                                               # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
a.clear                                           # => []
p a                                               # => []
a.concat(%w(hello world))                         # => ["hello", "world"]
p a                                               # => ["hello", "world"]

# We can use the replace method as well:
p a                                               # => ["hello", "world"]
a.replace([1,2,3,4,5])                            # => [1, 2, 3, 4, 5]
p a                                               # => [1, 2, 3, 4, 5]
