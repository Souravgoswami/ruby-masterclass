#!/usr/bin/ruby -w
# PART 12

# The push, append, concat, +=, << method can be
# used to add an element or an array of elements
# to another array
# The += method changes the memory location of the
# original array (thus changes the object_id) and it should
# be avoided in any cases... But we will look at it.
# We will compare efficient practices in section 40

a = (1..5).to_a                                                 # => [1, 2, 3, 4, 5]
a.push(100)                                                     # => [1, 2, 3, 4, 5, 100]
p a                                                             # => [1, 2, 3, 4, 5, 100]

a.push(5, 6, 7)                                                 # => [1, 2, 3, 4, 5, 100, 5, 6, 7]
p a                                                             # => [1, 2, 3, 4, 5, 100, 5, 6, 7]

# Append can be used to push *args into an Array
# it returns the Array itself (just like the push), so
# several methods can be chained together
a = Array(1..5)                                                 # => [1, 2, 3, 4, 5]
a.append(%w(x y z))                                             # => [1, 2, 3, 4, 5, ["x", "y", "z"]]
p a                                                             # => [1, 2, 3, 4, 5, ["x", "y", "z"]]
a.append(5).append(6, 7)                                        # => [1, 2, 3, 4, 5, ["x", "y", "z"], 5, 6, 7]
p a                                                             # => [1, 2, 3, 4, 5, ["x", "y", "z"], 5, 6, 7]

a = Array.new(5, &:itself)                                      # => [0, 1, 2, 3, 4]
a.concat(%w(a b c d e))                                         # => [0, 1, 2, 3, 4, "a", "b", "c", "d", "e"]

# push and append pushes one single element
# while concat concatenates an array
a, b = Array.new(5, &:next), %w(w x y z)                        # => [[1, 2, 3, 4, 5], ["w", "x", "y", "z"]]
p a.object_id                                                   # => 47043995340700
a.concat(b)                                                     # => [1, 2, 3, 4, 5, "w", "x", "y", "z"]
p a                                                             # => [1, 2, 3, 4, 5, "w", "x", "y", "z"]
a.push(%w(a b c d))                                             # => [1, 2, 3, 4, 5, "w", "x", "y", "z", ["a", "b", "c", "d"]]
p a                                                             # => [1, 2, 3, 4, 5, "w", "x", "y", "z", ["a", "b", "c", "d"]]
# You can't do:
# a.concat(5)
# You can:
a.concat([5])                                                   # => [1, 2, 3, 4, 5, "w", "x", "y", "z", ["a", "b", "c", "d"], 5]
p a.object_id    # The object id doesn't change at all          # => 47043995340700

# The += method can be used as replacement for concat,
# but again, it reassigns the whole array to new memory
# location. This is inefficient, and should be avoided but
# the += method exists.
a, b = Array.new(5), %w(nice hair)                              # => [[nil, nil, nil, nil, nil], ["nice", "hair"]]
p a.object_id                                                   # => 47043995367780
a += b                                                          # => [nil, nil, nil, nil, nil, "nice", "hair"]
p a                                                             # => [nil, nil, nil, nil, nil, "nice", "hair"]

# The << method is a complementary method of push.
# It also returns the self array, so it's possible to chain
# multiple method together or even << 'element' << 'element'
# E.g.:
a = 5, 6, 7                                                     # => [5, 6, 7]
p a.object_id                                                   # => 47043995365220
a << 1                                                          # => [5, 6, 7, 1]
a.<<(2)                                                         # => [5, 6, 7, 1, 2]
p a << 3                                                        # => [5, 6, 7, 1, 2, 3]
# a << 100 returns self, then << on that returns self
a << 100 << 200 << 300                                          # => [5, 6, 7, 1, 2, 3, 100, 200, 300]
p a                                                             # => [5, 6, 7, 1, 2, 3, 100, 200, 300]
p a.object_id                                                   # => 47043995365220
