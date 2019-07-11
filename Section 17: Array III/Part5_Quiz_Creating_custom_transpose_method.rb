#!/usr/bin/ruby -w
# PART 5

# Our own transpose method!
define_method(:transpose) { |ary| ary[0].size.times.map { |x| ary.size.times.map { |y| ary[y][x] } } }    # => :transpose

ary = 0.step(12, 3).map { |i| 3.times.map { |j| (i + j + 97).chr } }                                      # => [["a", "b", "c"], ["d", "e", "f"], ["g", "h", "i"], ["j", "k", "l"], ["m", "n", "o"]]
p ary.transpose                                                                                           # => [["a", "d", "g", "j", "m"], ["b", "e", "h", "k", "n"], ["c", "f", "i", "l", "o"]]
p transpose(ary)                                                                                          # => [["a", "d", "g", "j", "m"], ["b", "e", "h", "k", "n"], ["c", "f", "i", "l", "o"]]

ary = [[1, 2, 3, 4, 5], [false, [], true, (1..Float::INFINITY), FloatDomainError]]                        # => [[1, 2, 3, 4, 5], [false, [], true, 1..Infinity, FloatDomainError]]
p ary.transpose                                                                                           # => [[1, false], [2, []], [3, true], [4, 1..Infinity], [5, FloatDomainError]]
p transpose(ary)                                                                                          # => [[1, false], [2, []], [3, true], [4, 1..Infinity], [5, FloatDomainError]]
