#!/usr/bin/ruby -w
# PART 9

# The find method finds for an array element
# when an element is found
# the loop is broken, and the element is returned
# nil is returned if the element is not present
a = [0, 100, 200, 500, 300, 800, 400, 700, 900, 500, 500]    # => [0, 100, 200, 500, 300, 800, 400, 700, 900, 500, 500]
p a.find { |x| x == 500 }                                    # => 500
p a.find { |x| x == 550 }                                    # => nil

# The select method searches for the item
# throughout the whole array:
p a.select { |x| x == 500 }                                  # => [500, 500, 500]
p a.select { |x| x == 550 }                                  # => []
