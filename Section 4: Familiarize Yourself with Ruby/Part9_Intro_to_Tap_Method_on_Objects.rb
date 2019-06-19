# The tap method yields an object to a block,                           
# and returns the self object. It's available on every object.          
# It can eliminate the practice of assigning variables everytime!       
c = 500.tap { |x| p x }                                                 # => 500
p c                                                                     # => 500
                                                                        
a = 5.tap { |x| @val = x * x }                                          # => 5
p a                                                                     # => 5
p @val                                                                  # => 25
                                                                        
a = 'Hell'.tap { |y| y.concat('o') }                                    # => Hello
p a                                                                     # => Hello
