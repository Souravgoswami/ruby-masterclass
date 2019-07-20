#!/usr/bin/ruby -w
# Sun Jul 21 01:52:56 2019
# ruby 2.6.3
# Encoding: UTF-8
# PART 1

# As we have seen array stores (a) value(s) called element(s).
# Hash objects store key value pairs.
# Arrays store elements sequentially. But you shouldn't trust
# hash for storing sequential data.
# Hashes are very fast while looking up for items!
# Arrays are faster if you need to iterate over all the items!

# A literal hash is created with:
a = {'a' => 'Hello', 'b' => 'world'}                                                            # => {"a"=>"Hello", "b"=>"world"}
b = {5 => 6, true => false, false => nil}                                                       # => {5=>6, true=>false, false=>nil}
p a                                                                                             # => {"a"=>"Hello", "b"=>"world"}
# Any value can be fetched with the key:
p a['a']                                                                                        # => "Hello"
p a['b']                                                                                        # => "world"

p b[5]                                                                                          # => 6
p b[false]                                                                                      # => nil
p b[100]                                                                                        # => nil

# Hashes are mutable. That means you can also use
# The bracket syntax to add key-value pairs.
b[10] = 'Ruby'                                                                                  # => "Ruby"
p b                                                                                             # => {5=>6, true=>false, false=>nil, 10=>"Ruby"}
p b[10]                                                                                         # => "Ruby"

b[5] = 1000                                                                                     # => 1000
p b                                                                                             # => {5=>1000, true=>false, false=>nil, 10=>"Ruby"}

# Array can store duplicate items.
# But hashes can't. The key has to be unique. The value can be
# unique or non-unique

a = {'Ruby' => 'Java (JRuby)', 'GCC' => 'C', 'Python' => 'C', 'Ruby' => 'C'}                    # => {"Ruby"=>"C", "GCC"=>"C", "Python"=>"C"}
# warning: key "Ruby" is duplicated and overwritten on line ...

p a['Ruby']                                                                                     # => "C"

# Well, it can serve as a lookup table. Where you have student roll_numbers
# clipped with their respective names.
# Remember that the key has to be unique, otherwise the value will get overridden...
students = {1 => 'Zane Mercado', 2 => 'Haylie Walker', 3 => 'Reily Suarez', 4 => 'Siena Yu'}    # => {1=>"Zane Mercado", 2=>"Haylie Walker", 3=>"Reily Suarez", 4=>"Siena Yu"}

p students[1]    # Roll 1                                                                       # => "Zane Mercado"
p students[-1]    # Roll -1                                                                     # => nil
p students[4]    # Roll 4                                                                       # => "Siena Yu"
