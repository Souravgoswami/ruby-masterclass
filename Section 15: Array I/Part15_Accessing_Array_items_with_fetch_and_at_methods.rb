#!/usr/bin/ruby -w
# PART 15

# We have seen that we can use [] or slice methods to access array
# elements. We can use the fetch and at methods too!
a = %w(a b c a b c)                                                   # => ["a", "b", "c", "a", "b", "c"]
p a.fetch(2)     # returns the item at index 2                        # => "c"
p a.fetch(3) { |x| puts x }                                           # => "a"
# It raises an error if the index is out of bounds:
# p a.fetch(2000)    # IndexError
# But if you provide block, it won't raise the error,
# but it will yield the index to the block
p a.fetch(200) { |x| puts "#{x} is out of bounds" }                   # => nil

# To avoid this, you can also use the at method:
p a.at(2)                                                             # => "c"
# at returns nil if the index is out of bound!
p a.at(1000)                                                          # => nil

# Sometimes you need to have errors, in that case you can
# catch it gently. Or you can use blocks.
# Say the index 4 has nil:
a = [1, 2, 3, 4, nil, 6]                                              # => [1, 2, 3, 4, nil, 6]
p a.at(4)                                                             # => nil
p a.at(80)                                                            # => nil
p a.fetch(4)                                                          # => nil
p a.fetch(80) { |x| puts "Uh oh #{x} is out of bounds!" }             # => nil
# In such case fetch could come handy to inform our user!
# That said, both fetch and at could come handy
# while you program...
