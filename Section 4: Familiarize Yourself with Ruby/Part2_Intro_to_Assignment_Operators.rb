a = 5                                                        # => 5
b = 6.0                                                      # => 6.0
p b                                                          # => 6.0
                                                             
c = 5                                                        # => 5
# The conditional assignment                                 
# Will only assign value to a variable if the variable       
# has either false or nil value or not defined before.       
c ||= 100                                                    # => 5
                                                             
p c = false                                                  # => false
c ||= true                                                   # => true
p c                                                          # => true
