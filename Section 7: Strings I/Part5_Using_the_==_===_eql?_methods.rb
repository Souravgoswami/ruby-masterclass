#!/usr/bin/ruby -w                                                    
# PART 5                                                              
# The == method is available on any object                            
# As we discussed earlier, it's equality operator, and                
# != does the opposite                                                
p 'foo' == 'foo'                                                      # => true
p 'foo'.==('foo'.next)                                                # => false
p 'foo' == 'FOO'                                                      # => false
                                                                      
# The eql?() method is also avalilable on all the objects             
# Let's see it on an integer first!                                   
p 1 == 1                                                              # => true
p 1.eql?(1)                                                           # => true
                                                                      
p 1 == 1.0                                                            # => true
p 1.eql?(1.0)                                                         # => false
                                                                      
# Right in eql? the caller and the argument has to be same            
# class, and it has to be exactly the same! It's quite strict!        
# Now let's see it on String objects                                  
p 'foo'.eql?('foo')                                                   # => true
p 'foo'.eql?(1)                                                       # => false
p 'foo'.capitalize.eql?('Foo')                                        # => true
                                                                      
# The case subsumption operator can be used to check if               
# The class is string or not:                                         
p String === 'hi'                                                     # => true
p Math === 'hi'                                                       # => false
p Integer === 'hi'                                                    # => false
p %q$hi$.class === String                                             # => false
p Class === %q$hi$.class                                              # => true
                                                                      
# Or it could work just like the String#== or String#eql? methods:    
p 'hi' === 'hi'                                                       # => true
p 'hi' === 'hi'.next                                                  # => false
