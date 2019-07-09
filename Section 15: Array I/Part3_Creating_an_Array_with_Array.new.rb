#!/usr/bin/ruby -w
# PART 3

# The other way of creating an Array is:
p Array.new(5)                                                         # => [nil, nil, nil, nil, nil]
p Array.new(5, true)                                                   # => [true, true, true, true, true]

# note that the object id is same everywhere. It
# just creates the same item from index 0 to -1!
a = Array.new(3, [])                                                   # => [[], [], []]
p a[1].equal?(a[2])                                                    # => true

a = Array.new(5, rand(97..122).chr)                                    # => ["d", "d", "d", "d", "d"]
p a[0]                                                                 # => "d"
p a[0].class                                                           # => String
p a[0].replace('hi')                                                   # => "hi"
p a                                                                    # => ["hi", "hi", "hi", "hi", "hi"]

p a[1].replace('x')                                                    # => "x"
p a                                                                    # => ["x", "x", "x", "x", "x"]

# = changes the object id of string and arrays
# garbage collector collects the discarded value
# at the time the program exits (not at runtime).
p a[1] = 'y'                                                           # => "y"
p a                                                                    # => ["x", "y", "x", "x", "x"]
# In the above example, 'x' is handled by garbage collector.

# Another way of creating Array without object_id being similar
p Array.new(5, nil)                                                    # => [nil, nil, nil, nil, nil]
a = Array.new(5) { |i| i.to_s }                                        # => ["0", "1", "2", "3", "4"]
p a[0].equal?(a[1])                                                    # => false

# Blocks can be used as this
# (you can neither use method chaining nor can pass arguments)
p Array.new(5) { |i| i.next }                                          # => [1, 2, 3, 4, 5]
p Array.new(5, &:next)                                                 # => [1, 2, 3, 4, 5]

# The itself method is available on all the Ruby objects.
p Array.new(5, &:itself)                                               # => [0, 1, 2, 3, 4]

# Or to create single item:
Array('something')                                                     # => ["something"]
# You see Array is a method, it needs (), but Array.new is a class.
Kernel.Array(5)                                                        # => [5]
