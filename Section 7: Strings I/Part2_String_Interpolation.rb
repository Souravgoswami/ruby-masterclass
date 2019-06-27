#!/usr/bin/ruby -w                                              
# PART 2                                                        
# The String#* method can multipy a string n number of times    
p '-' * 10                                                      # => "----------"
p 'hello ' * 3                                                  # => "hello hello hello "
p 'hi' + 'hello ' * 3 + 'hi'                                    # => "hihello hello hello hi"
p 'hi' * (3 + 3)                                                # => "hihihihihihi"
