# PART 5                                                                 
# Integer to Float and vice versa                                        
# The to_i converts an Integer / Float / String object to Integer        
# The to_f converts an Integer / Float / String object to a Float        
p 5.to_i                                                                 # => 5
p 6.to_f                                                                 # => 6.0
                                                                         
p 4.to_f                                                                 # => 4.0
p 4.0.to_i                                                               # => 4
                                                                         
# Right, any object can be converted                                     
p '1hi'.to_i                                                             # => 1
p '2hi'.to_f                                                             # => 2.0
                                                                         
p '5_00hi'.to_i                                                          # => 500
p '          5_0hi'.to_f                                                 # => 50.0
                                                                         
p 'hi5'.to_i                                                             # => 0
p 'hi5'.to_f                                                             # => 0.0
