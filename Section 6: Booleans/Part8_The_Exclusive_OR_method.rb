# PART 8                                                                                   
# The exclusive or or ^ method is available on                                             
# objects belonging to  TrueClass, FalseClass                                              
# NilClass and Integer.                                                                    
p true ^ true                                                                              # => false
p true ^ false                                                                             # => true
p false ^ true                                                                             # => true
p false ^ false                                                                            # => false
                                                                                           
# Odd of true is true ;)                                                                   
p false ^ false ^ false                                                                    # => false
p false ^ true ^ false                                                                     # => true
p false ^ true ^ nil ^ true                                                                # => false
p true ^ true ^ true ^ nil ^ false ^ false ^ nil ^ nil                                     # => true
                                                                                           
p (0..100).map { [true, false, nil].sample }.then { |x| [x.count(true), x.reduce(:^)] }    # => [28, false]
                                                                                           
# Well it's not used much, but still for fun you can swap values                           
# with XOR (only for positive integers)                                                    
a, b = 100, 200                                                                            # => [100, 200]
                                                                                           
# We can swap values with `a, b = b, a`. But for fun, let's use XOR:                       
a ^= b                                                                                     # => 172
b ^= a                                                                                     # => 100
a ^= b                                                                                     # => 200
p "a = #{a}, b = #{b}"                                                                     # => "a = 200, b = 100"
