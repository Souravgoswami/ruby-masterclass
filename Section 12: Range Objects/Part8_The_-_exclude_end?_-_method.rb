#!/usr/bin/ruby -w
# PART 8

# You see, (1...9) excludes the 9!
a, b = 1...9, 1..9                    # => [1...9, 1..9]

p a.last                              # => 9
p b.last                              # => 9

p a.exclude_end?                      # => true
p b.exclude_end?                      # => false
p a.to_a                              # => [1, 2, 3, 4, 5, 6, 7, 8]
p b.to_a                              # => [1, 2, 3, 4, 5, 6, 7, 8, 9]
