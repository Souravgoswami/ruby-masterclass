#!/usr/bin/ruby -w
# PART 7

# The flatten method coalesces all the
# nested arrays into one array
a = [1, 2, 3, 4, [2, 3, 5], [100, 200, 300]]    # => [1, 2, 3, 4, [2, 3, 5], [100, 200, 300]]
p a.flatten                                     # => [1, 2, 3, 4, 2, 3, 5, 100, 200, 300]
p a                                             # => [1, 2, 3, 4, [2, 3, 5], [100, 200, 300]]

# There's also the flatten! method:
a.flatten!                                      # => [1, 2, 3, 4, 2, 3, 5, 100, 200, 300]
p a                                             # => [1, 2, 3, 4, 2, 3, 5, 100, 200, 300]
