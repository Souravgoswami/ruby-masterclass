#!/usr/bin/ruby -w
# PART 8

# The index method searches for an item and returns
# The index of the item

a = Array.new(15) { |i| Math.sin(i).round }            # => [0, 1, 1, 0, -1, -1, 0, 1, 1, 0, -1, -1, -1, 0, 1]
p a.index(0)                                           # => 0
p a.index(1)                                           # => 1
p a.index(-1)                                          # => 4
p a.index(true)                                        # => nil

p a.index { |i| i == -1 }                              # => 4

a = ('a'..'z').to_a                                    # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
p a.index('e')                                         # => 4
p a.index { |e| e.eql?('h') }                          # => 7
p a.index(100)                                         # => nil

#############################

# The rindex searches from right:
a = Array.new(15) { |i| Math.sin(i).round }            # => [0, 1, 1, 0, -1, -1, 0, 1, 1, 0, -1, -1, -1, 0, 1]
p a.rindex(0)                                          # => 13
p a.rindex(1)                                          # => 14
p a.rindex(-1)                                         # => 12

p a.rindex { |i| i == -1 }                             # => 12

a = ('a'..'z').to_a                                    # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
p a.rindex('e')                                        # => 4
p a.rindex { |e| e.eql?('h') }                         # => 7
