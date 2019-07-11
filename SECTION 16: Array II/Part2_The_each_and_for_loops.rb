#!/usr/bin/ruby -w
# PART 2

# The each and for loops
a = ('a'..'i').to_a                                             # => ["a", "b", "c", "d", "e", "f", "g", "h", "i"]

# The each loop iterates over all the array item
# and returns the array itself:
a.each { |x| puts x + 'i' }                                     # => ["a", "b", "c", "d", "e", "f", "g", "h", "i"]
p a.each { |x| puts x + x * 3 }.then { |x| x.equal?(a) }        # => true

# Now we can replace the times loop in our previous section:
b = %w(once upon a time in a galaxy far far away!)              # => ["once", "upon", "a", "time", "in", "a", "galaxy", "far", "far", "away!"]
b.each { |x| puts x.capitalize }                                # => ["once", "upon", "a", "time", "in", "a", "galaxy", "far", "far", "away!"]

# The for loop is a bit different:
gems = %w(ruby emerald diamond sapphire)                        # => ["ruby", "emerald", "diamond", "sapphire"]
for gem in gems do puts gem.capitalize end                      # => ["ruby", "emerald", "diamond", "sapphire"]
