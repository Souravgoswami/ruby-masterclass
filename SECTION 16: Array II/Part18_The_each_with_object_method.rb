#!/usr/bin/ruby -w
# PART 18

# The each_with_object method is like reduce(obj) or inject(obj)
ary = [1,2,3]                                                                                 # => [1, 2, 3]
ary.reduce('') { |str, el| str.concat(el.next.to_s) }                                         # => "234"
ary.each_with_object('') { |el, str| str.concat(el.next.to_s) }                               # => "234"

[36, 50, 602].each_with_object([]) { |el, ar| ar.push(el.gcd(10)) }                           # => [2, 10, 2]
[36, 50, 602].inject([]) { |ar, el| ar.push(el.gcd(10)) }                                     # => [2, 10, 2]

hash = (1..5).each_with_object({}) { |el, hash| hash.merge!(el => Math.log(el).round(2)) }    # => {1=>0.0, 2=>0.69, 3=>1.1, 4=>1.39, 5=>1.61}
puts hash                                                                                     # => nil
