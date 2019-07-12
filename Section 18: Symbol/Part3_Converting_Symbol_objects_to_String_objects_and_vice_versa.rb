#!/usr/bin/ruby -w
# PART 3

# Yes, symbols can be converted to string
a = :'Hello World'                           # => :"Hello World"
p a.to_s                                     # => "Hello World"
p a.id2name                                  # => "Hello World"

p a.upcase.to_s                              # => "HELLO WORLD"
p a.succ.to_s                                # => "Hello Worle"
p a.next.id2name                             # => "Hello Worle"

# Converting a string to a symbol:
a = 'Hello World'                            # => "Hello World"
p a.to_sym                                   # => :"Hello World"
p a.intern                                   # => :"Hello World"
