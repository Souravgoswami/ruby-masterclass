# PART 9                                                        
# Using the respond_to?(:method), you can check                 
# if an object responds to the method or not.                   
p 5.respond_to?(:odd?)                                          # => true
p 5.respond_to?('to_s')                                         # => true
                                                                
p 5.respond_to?('foo')                                          # => false
p 5.respond_to?(:respond_to?)                                   # => true
                                                                
# Alternatively you can do the following, which we will         
# cover in throughout the Array sections in more details        
p 5.methods.include?(:respond_to?)                              # => true
