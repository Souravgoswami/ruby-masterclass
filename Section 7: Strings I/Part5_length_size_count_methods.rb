#!/usr/bin/ruby -w                                    
# PART 5                                              
# The length, size, count methods                     
# Returns the character length of a string object.    
p 'hello world'.size                                  # => 11
p 'hello world'.length                                # => 11
p 'hello world'.bytesize                              # => 11
                                                      
p 'hello world'.count('l')                            # => 3
p 'Hello world!! This is Ruby!'.count(' ')            # => 4
