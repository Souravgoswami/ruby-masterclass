#!/usr/bin/ruby -w
# PART 11

# The partition method returns 2 arrays
# The arrays contain the elements of the enum
# for which the block evaluates to true, and false
# respectively

p (1..10).partition { |x| x.odd? }                        # => [[1, 3, 5, 7, 9], [2, 4, 6, 8, 10]]
p (1..10).partition(&:odd?)                               # => [[1, 3, 5, 7, 9], [2, 4, 6, 8, 10]]
p (1..10).partition(&:integer?)                           # => [[1, 2, 3, 4, 5, 6, 7, 8, 9, 10], []]
p (1..10).partition &:even?                               # => [[2, 4, 6, 8, 10], [1, 3, 5, 7, 9]]
p ('a'..'z').partition { |x| x[-1].ord.odd? }             # => [["a", "c", "e", "g", "i", "k", "m", "o", "q", "s", "u", "w", "y"], ["b", "d", "f", "h", "j", "l", "n", "p", "r", "t", "v", "x", "z"]]

# The group by method is similar but it returns a hash
# The hash contains true and false values:
p (1..10).group_by(&:odd?)                                # => {true=>[1, 3, 5, 7, 9], false=>[2, 4, 6, 8, 10]}
p ('a'..'z').group_by { |x| x[-1].ord.odd? }              # => {true=>["a", "c", "e", "g", "i", "k", "m", "o", "q", "s", "u", "w", "y"], false=>["b", "d", "f", "h", "j", "l", "n", "p", "r", "t", "v", "x", "z"]}
