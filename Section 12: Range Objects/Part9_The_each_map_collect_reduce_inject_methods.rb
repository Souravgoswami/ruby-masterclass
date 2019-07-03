#!/usr/bin/ruby -w
# PART 9

# The each method can be used to iterate over a Range
(1..10).each { |x| puts x }                                         # => 1..10
('a'..'z').each { |val| puts val.next }                             # => a..z

# The map method returns an Array:
a = 'a'..'z'                                                        # => a..z
p a.map { |x| x }                                                   # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
p a.map { |x| 'Hi ' + x.capitalize }                                # => ["Hi A", "Hi B", "Hi C", "Hi D", "Hi E", "Hi F", "Hi G", "Hi H", "Hi I", "Hi J", "Hi K", "Hi L", "Hi M", "Hi N", "Hi O", "Hi P", "Hi Q", "Hi R", "Hi S", "Hi T", "Hi U", "Hi V", "Hi W", "Hi X", "Hi Y", "Hi Z"]

# The collect method is exact copy of map:
p a.collect { |x| 'Hi ' + x.capitalize }                            # => ["Hi A", "Hi B", "Hi C", "Hi D", "Hi E", "Hi F", "Hi G", "Hi H", "Hi I", "Hi J", "Hi K", "Hi L", "Hi M", "Hi N", "Hi O", "Hi P", "Hi Q", "Hi R", "Hi S", "Hi T", "Hi U", "Hi V", "Hi W", "Hi X", "Hi Y", "Hi Z"]

# The reduce method iterates over a range, and does
# some certain operation on two items
p (1..5).reduce(:*)    # factorial                                  # => 120
p (1..10).reduce(:+)                                                # => 55
p (1..10).reduce(5, :+)                                             # => 60
p (1..10).reduce(10, :+)                                            # => 65
p (1..10).reduce(100, :+)                                           # => 155

# you noticed, it calls the * method with the next argument
p ('a'..'z').reduce(:+)                                             # => "abcdefghijklmnopqrstuvwxyz"
p ('a'..'z').reduce('a', :+)                                        # => "aabcdefghijklmnopqrstuvwxyz"
p ('a'..'z').reduce(:concat)                                        # => "abcdefghijklmnopqrstuvwxyz"

p ('a'..'z').reduce([]) { |array, item| array.push(item) }          # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
p (1..9).reduce('') { |string, item| string.concat(item.to_s) }     # => "123456789"

# The inject method is same to reduce
p ('a'..'z').inject(:concat)                                        # => "abcdefghijklmnopqrstuvwxyz"
p ('a'..'z').inject(String.new) { |str, item| str.concat(item) }    # => "abcdefghijklmnopqrstuvwxyz"
