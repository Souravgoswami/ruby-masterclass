#!/usr/bin/ruby -w                                            
# PART 14                                                     
# Did you notice bang methods on string objects?              
# They are methods with ! at the end...                       
# Array and Hash objects also have bang methods on them!      
# Bang methods modify the original string without changing    
# the object id!                                              
                                                              
a = 'Hello World'                                             # => Hello World
p a.object_id                                                 # => 47307195485080
                                                              
# Here neither a nor a's object id change                     
p a.next                                                      # => "Hello Worle"
p a                                                           # => "Hello World"
p a.object_id                                                 # => 47307195485080
                                                              
# Here a changes, but the object id doesn't                   
p a.next!                                                     # => "Hello Worle"
p a                                                           # => "Hello Worle"
p a.object_id                                                 # => 47307195485080
                                                              
# Take a look at another method!                              
p a.downcase                                                  # => "hello worle"
p a                                                           # => "Hello Worle"
                                                              
p a.downcase!                                                 # => "hello worle"
p a                                                           # => "hello worle"
                                                              
p a.capitalize!                                               # => "Hello worle"
p a                                                           # => "Hello worle"
                                                              
p a.chop                                                      # => "Hello worl"
p a                                                           # => "Hello worle"
                                                              
p a.chop!                                                     # => "Hello worl"
p a                                                           # => "Hello worl"
