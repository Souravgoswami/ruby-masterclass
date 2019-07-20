#!/usr/bin/ruby -w
# Encoding: UTF-8
# Sun Jul 21 04:40:33 2019
# ruby 2.6.3
# PART 9

# The each method for iteration
hash = (:a..:f).zip(1..6).to_h                                           # => {:a=>1, :b=>2, :c=>3, :d=>4, :e=>5, :f=>6}
hash.each { |key, value| puts key }                                      # => {:a=>1, :b=>2, :c=>3, :d=>4, :e=>5, :f=>6}
hash.each { |x| x.display }                                              # => {:a=>1, :b=>2, :c=>3, :d=>4, :e=>5, :f=>6}
# Here x[0] is the key and x[1] is the value
hash.each do |x| puts x[0] end                                           # => {:a=>1, :b=>2, :c=>3, :d=>4, :e=>5, :f=>6}

# We can also use reduce / inject and map / collect methods on a hash
power_of_3 = (1..8).reduce({}) { |h, x| h.merge(x => x ** 3) }           # => {1=>1, 2=>8, 3=>27, 4=>64, 5=>125, 6=>216, 7=>343, 8=>512}
power_of_3.map(&:last)                                                   # => [1, 8, 27, 64, 125, 216, 343, 512]

ascii = hash.reduce({}) { |h, x| h.merge(x[0].to_s => 96 + x[1]) }       # => {"a"=>97, "b"=>98, "c"=>99, "d"=>100, "e"=>101, "f"=>102}
ascii['a']                                                               # => 97
ascii['b'].chr                                                           # => "b"
