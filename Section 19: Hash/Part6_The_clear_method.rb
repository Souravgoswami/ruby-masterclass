#!/usr/bin/ruby -w
# Encoding: UTF-8
# Sun Jul 21 05:10:13 2019
# ruby 2.7.0
# PART 6

# The clear method clears a hash and returns itself.
a = {a: 'apple', b: 'ball'}                             # => {:a=>"apple", :b=>"ball"}
p a                                                     # => {:a=>"apple", :b=>"ball"}

a.clear                                                 # => {}
p a                                                     # => {}

# Because clear returns the itself object, method
# chaining is possible!
a.clear.store(4, 5)                                     # => 5
p a                                                     # => {4=>5}
