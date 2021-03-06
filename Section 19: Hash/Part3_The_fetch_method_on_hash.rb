#!/usr/bin/ruby -w
# Encoding: UTF-8
# Sun Jul 21 05:10:12 2019
# ruby 2.7.0
# PART 3

# The fetch method
fruits = {a: :apple, b: :banana, c: :cherry, d: :date, e: :eggfruit}    # => {:a=>:apple, :b=>:banana, :c=>:cherry, :d=>:date, :e=>:eggfruit}
p fruits[:a]                                                            # => :apple
p fruits.fetch(:a)                                                      # => :apple

# Like Array#fetch (which raises IndexError),
# Hash#fetch will raise KeyError if the key is not found
# p fruits.fetch(:f)    # KeyError
p fruits.fetch(:x) { |key| puts "Key #{key.inspect} not found!" }       # => nil
