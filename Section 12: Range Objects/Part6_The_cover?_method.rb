#!/usr/bin/ruby -w
# PART 6

# The cover method works like the include:
a = (1..10)                                   # => 1..10
p a.cover?(5)                                 # => true
p a.cover?('hello')                           # => false
p ('a'..'z').cover?('hey')                    # => true
p ('a'..'h').cover?('hey')                    # => false
p ('a'..'i').cover?('hey')                    # => true
