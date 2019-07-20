#!/usr/bin/ruby -w
# Sun Jul 21 01:52:56 2019
# ruby 2.6.3
# Encoding: UTF-8
# PART 7

# The length / size methods returns the length of the hash
a = {a: 'argon', b: 'berylium', c: 'cobalt'}                  # => {:a=>"argon", :b=>"berylium", :c=>"cobalt"}
p a.length                                                    # => 3
p a.size                                                      # => 3

# The empty method returns true if the array is empty
p a.empty?                                                    # => false
p({}.empty?)                                                  # => true
p a.clear.empty?                                              # => true
p a.empty?                                                    # => true
