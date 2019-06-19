# PART 10                                                      
# The spaceship operator (<=>) returns -1, 0, or 1             
p 1 <=> 2                                                      # => -1
p 1 <=> 1                                                      # => 0
p 1.<=>(0)                                                     # => 1
# When the object is smaller than the argument,                
# the <=> method returns -1, if they are equal, the            
# return value is 0, if the argument in bigger than the        
# object, it will return 1                                     
                                                               
# That's it for now. Well will take a deeper look at it        
# when learning the Enumerable module.                         
