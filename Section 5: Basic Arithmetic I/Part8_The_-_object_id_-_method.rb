# PART 8                                                
# The object_id returns the pointer to the              
# location in memory.                                   
# But for performance reasons the object_id of          
# true, false, Integers, Floats, nil, are fixed.        
                                                        
'Hello'.object_id                                       # => 46991948669920
'Hello'.object_id                                       # => 46991948775100
                                                        
1.object_id                                             # => 3
1.object_id                                             # => 3
                                                        
[1, 2, 3].object_id                                     # => 46991948770760
[1, 2, 3].object_id                                     # => 46991948768500
                                                        
nil.object_id                                           # => 8
nil.object_id                                           # => 8
                                                        
# Here's a map loop that returns the object_id          
# of 11 numbers                                         
p (0..10).map { |x| x.object_id }                       # => [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21]
