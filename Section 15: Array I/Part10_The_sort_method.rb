#!/usr/bin/ruby -w
# PART 10

# The sort method is a quick way to sort an array:
a = [1,5,3,2,0,1]                                            # => [1, 5, 3, 2, 0, 1]
p a.sort                                                     # => [0, 1, 1, 2, 3, 5]

a.replace %w(a e i o u b d c h f g)                          # => ["a", "e", "i", "o", "u", "b", "d", "c", "h", "f", "g"]
p a.sort                                                     # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "o", "u"]

a = [1,2,3, 'a', 'c', 'b', 6]                                # => [1, 2, 3, "a", "c", "b", 6]
# ArgumentError is raised if you are sorting an array
# with various objects
# a.sort    # Line 14: comparison of String with 6 failed
