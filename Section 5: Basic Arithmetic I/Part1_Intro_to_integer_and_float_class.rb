# PART 1                                                     
# Numbers in Ruby are either Integer or Float objects        
a = 5                                                        # => 5
p a.class                                                    # => Integer
p 5.class                                                    # => Integer
p 5.class.class                                              # => Class
                                                             
a = 5.0                                                      # => 5.0
p a.class                                                    # => Float
p 5.0.class                                                  # => Float
p 5.0.class.class                                            # => Class
                                                             
# An Integer and Float object can also created               
# with thousand separator                                    
a = 5_000_000                                                # => 5000000
p a.class                                                    # => Integer
                                                             
p 5_000_000.0_000_000                                        # => 5000000.0
