#!/usr/bin/ruby -w
# Fri Jul 12 17:36:43 2019
# ruby 2.6.3
# Encoding: UTF-8
# PART 1

# Symbols behave like strings but they are lightweight as integers.
# There are not many methods available on symbol.
# You see the reduce takes two arguments, one is mandatory:
(1..5).reduce(1, :*)                                                   # => 120
# The :* is a symbol
p :*.class                                                             # => Symbol

p :hello                                                               # => :hello
puts :hi!                                                              # => nil

# Symbols can be created in the following ways:
p :Hello_World                                                         # => :Hello_World
p :'Hello World'                                                       # => :"Hello World"
p %s(Hello World)                                                      # => :"Hello World"
