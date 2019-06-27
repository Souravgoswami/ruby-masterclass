#!/usr/bin/ruby -w                                                         
# PART 9                                                                   
# String can be concatenated in the following ways                         
a = 'Hello '                                                               # => Hello 
p a + 'World'                                                              # => "Hello World"
p a                                                                        # => "Hello "
                                                                           
a += 'World '                                                              # => Hello World 
p a                                                                        # => "Hello World "
                                                                           
p a << 'World '                                                            # => "Hello World World "
p a                                                                        # => "Hello World World "
                                                                           
p  a.concat 'World'                                                        # => "Hello World World World"
                                                                           
# Wyou add a string object with +, it just concatenates two strings        
# without modifying the original variable.                                 
# But if you want to change the variable a, you can                        
# use +=, <<, or concat methods.                                           
                                                                           
# Using +=                                                                 
# `a += 'World '` actually means `a = a + 'World '`                        
# You see your program has to get the value of a, add 'World' to it,       
# then write it to a new memory location! Which is ridiculous!             
# In that case if you are working with a billion character long string,    
# It will take huge time. Like a minute or so in my system.                
# It will also require more than 2 gigs of RAM.                            
# But if you use either concat or <<, you will save time and memory as     
# demostrated in the class!                                                
