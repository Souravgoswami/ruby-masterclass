#!/usr/bin/ruby -w
# Sun Jul 21 04:03:50 2019
# ruby 2.6.3
# Encoding: UTF-8
# PART 13

# When you use the bracket syntax to fetch an item,
# It returns the value of key if the key exists.
# Else, it returns nil by default. The behaviour can be
# changed with the default method on a proc
books = {matz: 'The Ruby Programming Language'}            # => {:matz=>"The Ruby Programming Language"}
books[:black] = 'The Well-Grounded Rubyist'                # => "The Well-Grounded Rubyist"

p books.default                                            # => nil
books.default = 0                                          # => 0
p books.default                                            # => 0

p [:something]                                             # => [:something]
p books[:matz]                                             # => "The Ruby Programming Language"

books.default = {}                                         # => {}
p books['hello']                                           # => {}
p books['matz']                                            # => {}

# But fetch will raise KeyError and not the
# default value if the key doesn't exist. You can
# use a block to warn about that...
p books.fetch('hi') { |x| puts x }                         # => nil
