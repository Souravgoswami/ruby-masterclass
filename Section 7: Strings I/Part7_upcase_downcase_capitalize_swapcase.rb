#!/usr/bin/ruby -w                                                                          
# PART 7                                                                                    
# The upcase method converts lowercase characters in a string to uppercase                  
# The downcase method converts uppercase characters in a string to lowercase                
# The capitalize method makes the first character of a string upcased, and all downcased    
                                                                                            
p 'Hello, this is Ruby'.upcase                                                              # => "HELLO, THIS IS RUBY"
p 'Hello, this is Ruby'.downcase                                                            # => "hello, this is ruby"
p 'Hello, this is Ruby'.capitalize                                                          # => "Hello, this is ruby"
p 'hello.world'.upcase                                                                      # => "HELLO.WORLD"
p 'HELLO.WORLD'.downcase                                                                    # => "hello.world"
p 'hello.world'.capitalize                                                                  # => "Hello.world"
p '...'.capitalize                                                                          # => "..."
