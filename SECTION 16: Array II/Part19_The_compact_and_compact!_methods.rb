#!/usr/bin/ruby -w
# PART 19

# The compact method removes all the nil elements from an array:
a = (1..20).map { |x| x if x.gcd(10) == 2 }                         # => [nil, 2, nil, 4, nil, 6, nil, 8, nil, nil, nil, 12, nil, 14, nil, 16, nil, 18, nil, nil]
p a                                                                 # => [nil, 2, nil, 4, nil, 6, nil, 8, nil, nil, nil, 12, nil, 14, nil, 16, nil, 18, nil, nil]
p a.compact                                                         # => [2, 4, 6, 8, 12, 14, 16, 18]

p a                                                                 # => [nil, 2, nil, 4, nil, 6, nil, 8, nil, nil, nil, 12, nil, 14, nil, 16, nil, 18, nil, nil]
p a.compact!                                                        # => [2, 4, 6, 8, 12, 14, 16, 18]
p a                                                                 # => [2, 4, 6, 8, 12, 14, 16, 18]

# If there's no nil elements, the compact! method returns nil
p a.compact!                                                        # => nil
# Be careful not to method chain bang methods!
p a.compact                                                         # => [2, 4, 6, 8, 12, 14, 16, 18]
