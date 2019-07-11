#!/usr/bin/ruby -w
# PART 16

# The empty? method check if the array is empty or not:
a = []                                                     # => []
p a.empty?                                                 # => true
a << 'hello there!'                                        # => ["hello there!"]
p a.empty?                                                 # => false

a.clear                                                    # => []
a << 'hello world' if a.empty?                             # => ["hello world"]
p a                                                        # => ["hello world"]
