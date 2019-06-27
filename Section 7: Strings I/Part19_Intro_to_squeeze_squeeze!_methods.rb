#!/usr/bin/ruby -w                                                 
# PART 19                                                          
# The include method can check if a stirng contains a substring    
p 'Hello'.include?('e')                                            # => true
p 'This is Ruby'.include?('Ruby')                                  # => true
                                                                   
a = 'Once upon a time, in a galaxy far far away'                   # => Once upon a time, in a galaxy far far away
p a.include? 'Once'                                                # => true
p a.include? 'once'                                                # => false
