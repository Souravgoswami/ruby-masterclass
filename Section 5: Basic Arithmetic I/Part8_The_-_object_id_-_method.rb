# PART 8                                                
# The object_id returns the pointer to the              
# location in memory.                                   
# But for performance reasons the object_id of          
# true, false, Integers, Floats, nil, are fixed.        
                                                        
'Hello'.object_id                                       # => 47066089867340
'Hello'.object_id                                       # => 47066089878160
                                                        
1.object_id                                             # => 3
1.object_id                                             # => 3
                                                        
[1, 2, 3].object_id                                     # => 47066090191780
[1, 2, 3].object_id                                     # => 47066090190780
                                                        
nil.object_id                                           # => 8
nil.object_id                                           # => 8
                                                        
# Here's a map loop that returns the object_id          
# of 11 numbers                                         
p (0..10).map { |x| x.object_id }                       # => [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21]
