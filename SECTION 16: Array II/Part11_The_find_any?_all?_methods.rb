#!/usr/bin/ruby -w
# PART 11

# The find method, as we saw previously, looks up for an element in an array
# passed as block.
# It returns nil if the item is not found.
# It returns an enumerator if no block is passed

a = %w(A ginger cat and a white bottle)                                         # => ["A", "ginger", "cat", "and", "a", "white", "bottle"]
p a.find { |x| x == 'ginger' }                                                  # => "ginger"
p a.find { |x| x == 'calico' }                                                  # => nil
p a.find { |x| x == 'calico' || x == 'ginger' }                                 # => "ginger"

# Not that's cool! How about the any? method?
# It goes through the array and yields each item.
# If the item is found, it returns true
# ary.any? is like asking: is there one item that matches the block:
p a.any? { |x| x == 'ginger' }                                                  # => true

# Or:
p [].empty?                                                                     # => true
p [].any?                                                                       # => false

p a.any?('ginger')                                                              # => true
p a.any?('calico')                                                              # => false
# or with Regexp
a.any?(/calico|ginger/)                                                         # => true

numbers = Array(0..25).select(&:odd?)                                           # => [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25]
p numbers.any?(&:odd?)                                                          # => true
p numbers.any?(&:even?)                                                         # => false
p numbers.any?(1)                                                               # => true
p numbers.any?(2)                                                               # => false

numbers << 2                                                                    # => [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 2]
p numbers.any?(&:odd?)                                                          # => true
p numbers.any?(&:even?)                                                         # => true
p numbers.any?(Integer)                                                         # => true
p numbers.any?(String)                                                          # => false

# The all? method returns true if all the elements
# evaluates to true when the certain condition is applied:
p a                                                                             # => ["A", "ginger", "cat", "and", "a", "white", "bottle"]
p a.all?(String)                                                                # => true
p a.all? { |x| String === x }                                                   # => true
p numbers.tap(&:pop)                                                            # => [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25]
p numbers.all? { |x| x.odd? }                                                   # => true
p numbers.all?(&:odd?)                                                          # => true
p numbers.push(200)                                                             # => [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 200]
p numbers.all?(&:odd?)                                                          # => false
p numbers.all?(&:even?)                                                         # => false
p numbers.tap(&:pop)                                                            # => [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25]
p numbers.push('20')                                                            # => [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, "20"]
# p numbers.all?(&:odd?)    # Error here!!

# Enumerable#select, find, any?, all? can be very handy
# when working with arrays.
