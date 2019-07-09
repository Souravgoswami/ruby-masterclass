#!/usr/bin/ruby -w
# PART 6

# This section covers accessing Array elements with [] syntax.
a = Array.new(10, &:next)                                         # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# getting items
p a[0]                                                            # => 1
p a[2..3]                                                         # => [3, 4]
p a[2, 3]                                                         # => [3, 4, 5]
p a[-1]                                                           # => 10

# mutating arrays
p a[0] = 5                                                        # => 5
p a                                                               # => [5, 2, 3, 4, 5, 6, 7, 8, 9, 10]
p a[-1] = 0                                                       # => 0
p a                                                               # => [5, 2, 3, 4, 5, 6, 7, 8, 9, 0]

p a[0, 5] = %w(a b c d e)                                         # => ["a", "b", "c", "d", "e"]
p a                                                               # => ["a", "b", "c", "d", "e", 6, 7, 8, 9, 0]

p a[0, 4] = 'a'                                                   # => "a"
p a                                                               # => ["a", "e", 6, 7, 8, 9, 0]
