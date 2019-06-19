# The then method modifies the actual value.             
# It's available on every object.                        
a = 5.then { |x| x + x }                                 # => 10
p a                                                      # => 10
                                                         
a = 100.then { 'hello' }                                 # => hello
p a                                                      # => hello
                                                         
# Both the tap and then method will be fruitful          
# Throughout the sections. It might not make sense       
# now because we are just in the very basics.            
# We will see how it can reduce many SLOC!               
