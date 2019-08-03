#!/usr/bin/ruby -w
# Encoding: UTF-8
# Fri Aug  2 23:30:19 2019
# ruby 2.7.0
# PART 10

# There's also a instance_method method available on classes
# This could be slower
p Integer.instance_method(:next).bind(1).call         # => 2

# Another example
ary = (1..5).to_a
p Array.instance_method(:delete).bind(ary).call(5)    # => 5
p ary                                                 # => [1, 2, 3, 4]

str_unbound = String.instance_method(:bytesize)
a = 'Hello World'
p str_unbound.bind(a).call                            # => 11
