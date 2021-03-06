#!/usr/bin/ruby -w
# Encoding: UTF-8
# Sun Jul 21 05:10:13 2019
# ruby 2.7.0
# PART 14

# The default_proc method can be used
# for enabling certain tasks like:
hash = Hash.new('a' => 'apple')                     # => {}
hash.default_proc = proc { |x, y| y * 2 }           # => #<Proc:0x000055d4c6c515e8@/home/sourav/Documents/ruby-masterclass/Section 19: Hash/code_evaluator.rb:77>

# Now rather than fetching elements it will do
# something weird
hash['a']                                           # => "aa"

hash.default_proc = proc { |h, k| h[k] = k * k }    # => #<Proc:0x000055d4c6c50940@/home/sourav/Documents/ruby-masterclass/Section 19: Hash/code_evaluator.rb:77>
p hash[4]                                           # => 16
p hash                                              # => {4=>16}

p = hash.default_proc                               # => #<Proc:0x000055d4c6c50940@/home/sourav/Documents/ruby-masterclass/Section 19: Hash/code_evaluator.rb:77>
a = []                                              # => []
p p.call(a, 2)                                      # => 4
p a                                                 # => [nil, nil, 4]

# Another way:
hash = Hash.new { |h, k| h[k] = k * k }             # => {}
p hash[2]                                           # => 4
p hash                                              # => {2=>4}

a = []                                              # => []
hash.default_proc.(a, 5)                            # => 25
p a                                                 # => [nil, nil, nil, nil, nil, 25]
