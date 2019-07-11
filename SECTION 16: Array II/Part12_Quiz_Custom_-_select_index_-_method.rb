#!/usr/bin/ruby -w
# PART 12

# Creating our custom find_all_index method:
define_method(:find_all_index) { |ary, ele| ary.map.with_index { |e, i| [i, e] if ele === e }.compact.then { |x| x.empty? ? nil : x } }    # => :find_all_index

a = %w(one green apple everyday keeps the doctor away!!)                                                                                   # => ["one", "green", "apple", "everyday", "keeps", "the", "doctor", "away!!"]
b = %w(Once upon a time in a galaxy far far away!)                                                                                         # => ["Once", "upon", "a", "time", "in", "a", "galaxy", "far", "far", "away!"]
p find_all_index(a, 'one')                                                                                                                 # => [[0, "one"]]
p find_all_index(b, 'far')                                                                                                                 # => [[7, "far"], [8, "far"]]
p find_all_index(a, 'doctors')                                                                                                             # => nil
