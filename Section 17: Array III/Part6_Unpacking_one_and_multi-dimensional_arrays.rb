#!/usr/bin/ruby -w
# PART 6

# Unpacking one and multi-dimentional arrays
ary = %w(once upon a time in a galaxy far far away)                    # => ["once", "upon", "a", "time", "in", "a", "galaxy", "far", "far", "away"]
a, b, c, d, e, f, g = ary                                              # => ["once", "upon", "a", "time", "in", "a", "galaxy", "far", "far", "away"]
p a                                                                    # => "once"
p b                                                                    # => "upon"
p c                                                                    # => "a"
p d                                                                    # => "time"
p e                                                                    # => "in"
p f                                                                    # => "a"
p g                                                                    # => "galaxy"

# elements "far", "far", and "away" are never assigned in such case
ary = %w(hello beautiful world)                                        # => ["hello", "beautiful", "world"]
a, b = ary                                                             # => ["hello", "beautiful", "world"]
p a                                                                    # => "hello"
p b                                                                    # => "beautiful"

# You can use this syntax if you don't want the rest items:
ary = %w(ruby crystal perl)                                            # => ["ruby", "crystal", "perl"]
a, b, * = ary                                                          # => ["ruby", "crystal", "perl"]
p a                                                                    # => "ruby"
p b                                                                    # => "crystal"

aa, * = ary.rotate                                                     # => ["crystal", "perl", "ruby"]
p aa                                                                   # => "crystal"

# We can splat (*) unpack an array.
# Here we are going to assign the first elements to a
# the last one to b
*a, b = [1,2,3]                                                        # => [1, 2, 3]
p a                                                                    # => [1, 2]
p b                                                                    # => 3

*a, b = ary                                                            # => ["ruby", "crystal", "perl"]
p a                                                                    # => ["ruby", "crystal"]
p b                                                                    # => "perl"

a, *b = ary                                                            # => ["ruby", "crystal", "perl"]
p a                                                                    # => "ruby"
p b                                                                    # => ["crystal", "perl"]

# Unpacking multi-dimentional arrays:
ary = 0.step(10, 3).map { |x| 3.times.map { |y| 97.+(x + y).chr } }    # => [["a", "b", "c"], ["d", "e", "f"], ["g", "h", "i"], ["j", "k", "l"]]
a, b = ary                                                             # => [["a", "b", "c"], ["d", "e", "f"], ["g", "h", "i"], ["j", "k", "l"]]
p a                                                                    # => ["a", "b", "c"]
p b                                                                    # => ["d", "e", "f"]

a, *b = *ary                                                           # => [["a", "b", "c"], ["d", "e", "f"], ["g", "h", "i"], ["j", "k", "l"]]
p a                                                                    # => ["a", "b", "c"]
p b                                                                    # => [["d", "e", "f"], ["g", "h", "i"], ["j", "k", "l"]]

# An array can be created like this:
*a = 'Hello world'                                                     # => "Hello world"
p a                                                                    # => ["Hello world"]

# Or:
a = *'Hello World'                                                     # => ["Hello World"]

# While creating non integer array without [] the assigned objects
# doesn't become an array
p a = 'a', 'b', 'c', nil, false                                        # => ["a", "b", "c", nil, false]
p a                                                                    # => "a"

# You can use the following syntax to overcome the problem
a = * 'a', 'b', 'c', '5', nil, false                                   # => ["a", "b", "c", "5", nil, false]
p a                                                                    # => ["a", "b", "c", "5", nil, false]
