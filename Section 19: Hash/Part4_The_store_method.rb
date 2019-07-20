#!/usr/bin/ruby -w
# Encoding: UTF-8
# Sun Jul 21 04:40:33 2019
# ruby 2.6.3
# PART 4

# The store method stores key-value paris to a hash
# and returns a string
a = b = Hash.new                                       # => {}
a.store(1, 'C#')                                       # => "C#"
p a                                                    # => {1=>"C#"}

a.store(1, 'Ruby')                                     # => "Ruby"
p a                                                    # => {1=>"Ruby"}

p a.store(2, 'Crystal')                                # => "Crystal"
p a.store(3, 'C++')                                    # => "C++"
p a.store(4, 'Rust')                                   # => "Rust"

p a                                                    # => {1=>"Ruby", 2=>"Crystal", 3=>"C++", 4=>"Rust"}
p b                                                    # => {1=>"Ruby", 2=>"Crystal", 3=>"C++", 4=>"Rust"}
