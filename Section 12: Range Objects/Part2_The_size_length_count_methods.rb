#!/usr/bin/ruby -w
# PART 2

# the size methods can be used to get the size of the range
p (1..100).size                                                                        # => 100
p (1...100).size                                                                       # => 99
p (1..100_000_000_000_000).size.to_s.reverse.gsub(/\d{1,3}/).to_a.join(',').reverse    # => "100,000,000,000,000"

# The count method can be used for counting the occurence of something:
p (1..100).count { |x| x.odd? }                                                        # => 50
# similar to:
p (1..100).count(&:odd?)                                                               # => 50
p ('a'..'z').count { |x| x == 'ruby' }                                                 # => 0

# Size will not work expectedly if you are using alphabetical ranges:
p ('a'..'z').size                                                                      # => nil
p ('a'..'z').count                                                                     # => 26
# In the above case, the size method should be used on numerical ranges
# As ruby documentation (ri) says!

# The do ... end block can also be used
p Range.new('a', 'z').count do |x| x.ord == 97 end                                     # => 26
