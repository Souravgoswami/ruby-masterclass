# PART 3                                                          
# The next and succ methods are avaiable on                       
# Integer and String objects.                                     
# We'll see next_float method on Float objects soon               
                                                                  
# succ is actually a complementary method. It's just next!        
a = 5                                                             # => 5
p a.succ                                                          # => 6
p a.succ.succ.succ                                                # => 8
                                                                  
a = 5                                                             # => 5
a += 1                                                            # => 6
p a                                                               # => 6
                                                                  
# Ok this is heavier than `a += 4`... But it's possible           
p a = a.next.succ.next.succ                                       # => 10
