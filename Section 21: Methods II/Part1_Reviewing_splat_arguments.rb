#!/usr/bin/ruby -w
# Encoding: UTF-8
# Fri Aug  2 23:30:19 2019
# ruby 2.7.0
# PART 1

# Splat arguments can be used if you want to take multiple arguments
# which is not defined.

def x(*args) args end

p x

def y(arg = 'Something', *args) [args.flatten, arg] end

p y([1, 2, 3, [4,5,6]], [5, 5, 5], [1,2,3,4], [0], 'abcd')

def z(*args, e) e end

p z('hi', 5)
p z('hello', 'beautiful', 'world')
p z('hello')
