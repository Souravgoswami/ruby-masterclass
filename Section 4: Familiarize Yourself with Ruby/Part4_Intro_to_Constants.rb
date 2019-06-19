# Unlike variables, constants should not change.          
A = 5                                                     # => 5
# Their value can be changed, but it will warn you.       
# It is a bad practice.                                   
A = 5                                                     # => 5
                                                          
# You can use conditional assignment operators            
# But if A is nil, it will warn you again!                
A ||= 7                                                   # => 5
