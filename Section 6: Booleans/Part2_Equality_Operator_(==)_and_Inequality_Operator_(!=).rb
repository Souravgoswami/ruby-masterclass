# PART 2                                                          
# We can use the equality operator (==) to check if               
# the object that == is called on is equal to the argument        
# or not                                                          
p 5 == 5                                                          # => true
p 5 == 3                                                          # => false
p 3 == 5 - 2                                                      # => true
p 16.==(2 ** 4)                                                   # => true
                                                                  
p 5 != 5                                                          # => false
p 5 != 3                                                          # => true
p 3 != 5 - 2                                                      # => false
p 16.!=(2 ** 4)                                                   # => false
