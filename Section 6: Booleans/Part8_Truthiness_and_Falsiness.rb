# PART 8                                                                                           
# The exclusive or or ^ method is available on                                                     
# objects belonging to  TrueClass, FalseClass                                                      
# NilClass and Integer.                                                                            
p true ^ true                                                                                      # => false
p true ^ false                                                                                     # => true
p false ^ true                                                                                     # => true
p false ^ false                                                                                    # => false
                                                                                                   
# Odd of true is true ;)                                                                           
p false ^ false ^ false                                                                            # => false
p false ^ true ^ false                                                                             # => true
p false ^ true ^ nil ^ true                                                                        # => false
p true ^ true ^ true ^ nil ^ false ^ false ^ nil ^ nil                                             # => true
                                                                                                   
p 10_000.times.map { [true, false, nil].sample }.then { |x| [x.count(true), x.reduce(:^)] }        # => [3329, true]
