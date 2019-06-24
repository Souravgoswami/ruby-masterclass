# PART 1                                                   
# As we saw in the odd? and even? methods, there           
# exists true and false objects in Ruby.                   
                                                           
# The true and false objects belong to                     
# TrueClass and FalseClass respectively.                   
                                                           
p true.class                                               # => TrueClass
p false.class                                              # => FalseClass
p nil.class                                                # => NilClass
# As we see it's not False or True, it's FalseClass and    
# TrueClass.                                               
# There are eager operators like not, !, |, &              
                                                           
p true | true                                              # => true
p true | false                                             # => true
p false | true                                             # => true
p false | false                                            # => false
                                                           
p true & true                                              # => true
p true & false                                             # => false
p false & true                                             # => false
p false & false                                            # => false
                                                           
p true.|(true).|(false)                                    # => true
p true.&(true).&(false)                                    # => false
