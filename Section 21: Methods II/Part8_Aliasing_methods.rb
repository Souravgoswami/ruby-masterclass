#!/usr/bin/ruby -w
# Encoding: UTF-8
# Fri Aug  2 23:30:19 2019
# ruby 2.7.0
# PART 8

# Methods can be aliased.
def x
	srand
end

alias :y :x
alias z y

p x
p y
p z

# Note that alias is not a method
p respond_to?(:alias)

# Will raise syntax errors
# p method(:alias)
# p defined?(alias)
