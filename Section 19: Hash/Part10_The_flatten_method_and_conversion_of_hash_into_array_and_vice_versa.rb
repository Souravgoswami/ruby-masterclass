#!/usr/bin/ruby -w
# Sun Jul 21 01:39:56 2019
# ruby 2.6.3
# Encoding: UTF-8
# PART 10

# The flatten method and conversion of an array into hash
# The flatten method can be used to convert a hash into an array:
a = {a: 1, b: 2, c: 3}                                               # => {:a=>1, :b=>2, :c=>3}
p a.flatten                                                          # => [:a, 1, :b, 2, :c, 3]
p a.flatten.then { |x| [x[0], x[-1]]}                                # => [:a, 3]

# It actually flattens every key and value. But the to_a method
# can convert a hash into a multi-dimensional array:
p a                                                                  # => {:a=>1, :b=>2, :c=>3}
p a.to_a                                                             # => [[:a, 1], [:b, 2], [:c, 3]]
p a.to_a[1][1]                                                       # => 2

# The to_h method can convert an array into a hash
# The first item has to be an array [[]]
# [:a, 1].to_h    # TypeError
[[:a, 1]].to_h                                                       # => {:a=>1}
[[:a, 1], [:b, 2]].to_h                                              # => {:a=>1, :b=>2}

ary = ('a'..'d').zip(1..4)                                           # => [["a", 1], ["b", 2], ["c", 3], ["d", 4]]
p ary                                                                # => [["a", 1], ["b", 2], ["c", 3], ["d", 4]]
p ary.to_h                                                           # => {"a"=>1, "b"=>2, "c"=>3, "d"=>4}
