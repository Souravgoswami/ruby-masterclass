# PART 9                                                       
# The is_a and kind_of method works similarly                  
# They return if an object belongs to a given class            
p 5.is_a?(Integer)                                             # => true
p 5.is_a?(String)                                              # => false
p 5.kind_of?(Array)                                            # => false
                                                               
# The case subsumption operator (===) can also be used:        
p Integer === 5                                                # => true
                                                               
# You can use the class method                                 
a = 5                                                          # => 5
p a.class == Integer                                           # => true
                                                               
# Only available to Numeric                                    
p a.integer?                                                   # => true
