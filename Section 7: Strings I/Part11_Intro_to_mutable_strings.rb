#!/usr/bin/ruby -w                         
# PART 11                                  
# In Ruby, Strings are mutable objects!    
a = 'Perl is awesome'                      # => Perl is awesome
a[0..3] = 'Ruby'                           # => Ruby
a[0..-1] = 'Hello World'                   # => Hello World
p a                                        # => "Hello World"
                                           
a = 'Hello World'                          # => Hello World
a[6..-1] = 'Ruby'                          # => Ruby
p a                                        # => "Hello Ruby"
