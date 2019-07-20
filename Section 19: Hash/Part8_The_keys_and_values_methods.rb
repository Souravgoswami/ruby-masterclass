#!/usr/bin/ruby -w
# Sun Jul 21 01:52:56 2019
# ruby 2.6.3
# Encoding: UTF-8
# PART 8

# The keys methods rerturns all the hash
# keys as an array, and the values method returns all the values
# as an array:
hash = {a: 'hello', 1 => 'world', true => false}                           # => {:a=>"hello", 1=>"world", true=>false}
p hash.keys                                                                # => [:a, 1, true]
p hash.values                                                              # => ["hello", "world", false]

p hash.keys.each { |x| puts x }                                            # => [:a, 1, true]
# The each_key iterates over all the key and returns the self hash
p hash.each_key { |x| puts x }                                             # => {:a=>"hello", 1=>"world", true=>false}

# Hash#values
p hash.values                                                              # => ["hello", "world", false]
# the each_value iterates over all the values and returns the self hash
p hash.values.each { |x| puts x }                                          # => ["hello", "world", false]
p hash.each_value { |x| puts x }.store(:b, 5)                              # => 5

p hash                                                                     # => {:a=>"hello", 1=>"world", true=>false, :b=>5}

# Not to confuse, there's a method called hash on every object.
# p self.hash()    # No relation with a hash object whatsoever.
