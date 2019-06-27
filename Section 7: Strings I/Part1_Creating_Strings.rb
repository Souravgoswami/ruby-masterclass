#!/usr/bin/ruby -w                                         
# PART 1                                                   
# Strings can be created in many ways:                     
a = "Hello World"                                          # => Hello World
b = 'Hello World'                                          # => Hello World
d = %Q(Hello World)                                        # => Hello World
c = %q(Hello World)                                        # => Hello World
e = "Hello ""World"                                        # => Hello World
f = %/Hello World/                                         # => Hello World
p a, b, c, d, e, f                                         # => ["Hello World", "Hello World", "Hello World", "Hello World", "Hello World", "Hello World"]
                                                           
# Apart from this, there are various here docs which we    
# will take a look at Strings III                          
                                                           
# The %q and the () can be replaced                        
# with any non-alphanumeric characters:                    
%Q[hi]                                                     # => hi
%+hello+                                                   # => hello
%q&hola&                                                   # => hola
