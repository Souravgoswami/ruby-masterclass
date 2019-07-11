#!/usr/bin/ruby -w
# PART 1

# The uniq method removes all the duplicate
# objects from an Array!
ARY = [1, 2, 3, 5, 5, 90, 1, 200, 345]                # => [1, 2, 3, 5, 5, 90, 1, 200, 345]
p ARY                                                 # => [1, 2, 3, 5, 5, 90, 1, 200, 345]
p ARY.uniq                                            # => [1, 2, 3, 5, 90, 200, 345]
p ARY                                                 # => [1, 2, 3, 5, 5, 90, 1, 200, 345]

p ARY.uniq!                                           # => [1, 2, 3, 5, 90, 200, 345]
p ARY                                                 # => [1, 2, 3, 5, 90, 200, 345]

# Now that we have all duplicates removed, let's
# see what is returned by uniq and uniq!
p ARY.uniq                                            # => [1, 2, 3, 5, 90, 200, 345]
p ARY.uniq!                                           # => nil

# Right uniq! returns nil if there's no duplicates
ARY << 5                                              # => [1, 2, 3, 5, 90, 200, 345, 5]
# or it returns the original array!
# That's a caveat while using method chaining
# bang methods.
# You should do some research before you method
# chain a method after a bang method!
p ARY.uniq!                                           # => [1, 2, 3, 5, 90, 200, 345]
p ARY.uniq!                                           # => nil
