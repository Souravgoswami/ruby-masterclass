#!/usr/bin/ruby -w
# PART 7

# The slice method is alternative to [] method on arrays
# This is very much like the slice method on string...
a = Array.new(10, &:next)                                   # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
p a[0]                                                      # => 1
p a.slice(0)                                                # => 1

p a[0..1]                                                   # => [1, 2]
p a.slice(0..1)                                             # => [1, 2]

p a[2, 3]                                                   # => [3, 4, 5]
p a.slice(2, 3)                                             # => [3, 4, 5]

p a[-1]                                                     # => 10
p a.slice(-1)                                               # => 10
