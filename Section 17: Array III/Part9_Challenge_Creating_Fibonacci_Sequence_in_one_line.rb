#!/usr/bin/ruby -w
# PART 9

# Fibonacci for one liners!

# 1.
10.times.reduce([0, 1]) { |ary| ary.push(ary.last(2).sum) }                 # => [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]

# 2.
10.times.each_with_object([0, 1]) { |_, ary| ary.push(ary.last(2).sum) }    # => [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]

# 3.
[0, 1].tap { |x| 10.times { x.push(x[-1] + x[-2]) } }                       # => [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]

# 4.
->(a = 1, b = 0) { 12.times.map { (a, b = b, a + b)[0] } }.call             # => [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]
