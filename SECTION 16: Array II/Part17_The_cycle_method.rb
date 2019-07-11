#!/usr/bin/ruby -w
# PART 17

# The cycle method:
a = [1,2,3]                       # => [1, 2, 3]
a.cycle(2) { |x| puts x }         # => nil
a = ['a', 'b']                    # => ["a", "b"]
a.cycle(2) { |x| x.concat(x) }    # => nil
p a                               # => ["aaaa", "bbbb"]
