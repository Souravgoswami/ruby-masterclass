# PART 2                                                        
p a = 5                                                         # => 5
p a + 5                                                         # => 10
p a                                                             # => 5
                                                                
p 5 ** 2                                                        # => 25
# Ruby has no difficulty to work with very long integers        
p 5 ** 100                                                      # => 7888609052210118054117285652827862296732064351090230047702789306640625
                                                                
p a += 5                                                        # => 10
p a                                                             # => 10
                                                                
p a *= 10                                                       # => 100
p a %= 30                                                       # => 10
p a /= 2                                                        # => 5
p a -= 1                                                        # => 4
p a **= 3                                                       # => 64
                                                                
# Float objects are simply numbers with fractional part:        
a = 5.0                                                         # => 5.0
p a.class                                                       # => Float
                                                                
p 10 / 3                                                        # => 3
p 10 / 3.0                                                      # => 3.3333333333333335
                                                                
# Differenct operators have different precedence in Ruby        
a = 5 + 5 / 2 * 2 - 3 % 3                                       # => 9
                                                                
# The cheat sheet is uploaded to GitHub!!                       
