#!/usr/bin/ruby -w
# PART 16

# Bracket syntax can also overwrite values just like the
# bracket syntax on strings:
a = 1, 2, 3, 4                                                     # => [1, 2, 3, 4]
p a.object_id                                                      # => 47043995446020
a[1, 1] = 'a'                                                      # => a
p a                                                                # => [1, "a", 3, 4]
p a[1, 2] = 'z'                                                    # => "z"
p a                                                                # => [1, "z", 4]
p a[4, 0] = 'y'                                                    # => "y"
p a                                                                # => [1, "z", 4, nil, "y"]
p a[1, 0] = 'l'                                                    # => "l"
p a                                                                # => [1, "l", "z", 4, nil, "y"]
p a.object_id                                                      # => 47043995446020

# Surely garbage collector collects the old value but after the
# program exits!
