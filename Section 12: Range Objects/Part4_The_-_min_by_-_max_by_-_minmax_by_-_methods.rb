#!/usr/bin/ruby -w
# PART 4

# The result of the min can also be changed:
p ('a'..'zzz').min_by { |x| x.length }                    # => "a"
# the above can be replaced with:
p ('a'..'zzz').min_by(&:length)                           # => "a"

p ('a'..'zzz').min_by(4) { |x| x }                        # => ["a", "aa", "aaa", "aab"]
p ('a'..'zzz').min_by(4, &:next)                          # => ["z", "zz", "zzz", "aaa"]

# max_by:
p ('a'..'zzz').max_by(&:length)                           # => "aaa"
p ('a'..'zzz').max_by(2, &:next)                          # => ["zzy", "zzx"]

# minmax_by:
p ('a'...'zzz').minmax_by(&:length)                       # => ["a", "aaa"]
p ('a'...'zzz').minmax_by(&:next)                         # => ["z", "zzy"]

# getting random elements from a range (just for demo)
# Don't use them instead of Kernel.rand / Random.rand
# SecureRandom.rand
p (1...100).min_by { rand }                               # => 17
p rand(1...1000)                                          # => 48
p (1...1000).max_by { rand }                              # => 119
p (1...1000).minmax_by { rand }                           # => [492, 679]
p [Kernel.rand(1...1000), Kernel.rand(1...1000)]          # => [966, 394]
