#!/usr/bin/ruby -w
# Encoding: UTF-8
# Sun Jul 21 04:40:33 2019
# ruby 2.6.3
# PART 5

# The merge method can be used to merge
# a hash into another hash:
a, b = {a: 100, b: 200}, {b: 300, c: 400, d: 500}                                      # => [{:a=>100, :b=>200}, {:b=>300, :c=>400, :d=>500}]
p a.merge(b)                                                                           # => {:a=>100, :b=>300, :c=>400, :d=>500}

# Another example:
v = "\xf0\x9d\x93\xa9"                                                                 # => "𝓩"
ch = ('a'..'z').reduce({}) { |h, c| h.merge(c.intern => v = v.next) }                  # => {:a=>"𝓪", :b=>"𝓫", :c=>"𝓬", :d=>"𝓭", :e=>"𝓮", :f=>"𝓯", :g=>"𝓰", :h=>"𝓱", :i=>"𝓲", :j=>"𝓳", :k=>"𝓴", :l=>"𝓵", :m=>"𝓶", :n=>"𝓷", :o=>"𝓸", :p=>"𝓹", :q=>"𝓺", :r=>"𝓻", :s=>"𝓼", :t=>"𝓽", :u=>"𝓾", :v=>"𝓿", :w=>"𝔀", :x=>"𝔁", :y=>"𝔂", :z=>"𝔃"}

'ruby'.downcase.chars.map { |c| ch[c.intern] }.join                                    # => "𝓻𝓾𝓫𝔂"

STDIN.gets.then { |x| x ? x : 'test' }.downcase.chars.map { |c| ch[c.intern] }.join    # => "𝓽𝓮𝓼𝓽"

# The merge method also takes a block:
p a                                                                                    # => {:a=>100, :b=>200}
p a.merge(b) { }                                                                       # => {:a=>100, :b=>nil, :c=>400, :d=>500}
p a.merge(b) { |key, val1, val2| val1 + val2 }                                         # => {:a=>100, :b=>500, :c=>400, :d=>500}
p a.merge!(b) { |_, x, y| x - y }                                                      # => {:a=>100, :b=>-100, :c=>400, :d=>500}
p a                                                                                    # => {:a=>100, :b=>-100, :c=>400, :d=>500}
