#!/usr/bin/ruby -w                                                
# PART 16                                                         
# The index method returns the index of a character from left:    
p 'Ruby is my favourite programming language!'.index('u')         # => 1
# Here it's 1 because it's after R, which is in index 0           
                                                                  
# The rindex counts from right                                    
p 'Ruby is my favourite programming language!'.rindex('u')        # => 37
# This counts the index of language's u, which is at 37           
