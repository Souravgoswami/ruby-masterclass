#!/usr/bin/ruby -w                                                             
# Part 10                                                                      
# The empty method can be used to check if a string is empty or not!           
# It might sound like stupid but we will see in block sections, how these      
# methods (first, last on arrays (instead of [0] or [-1],                      
# empty? on strings (instead of str == '')                                     
# odd?, even? on Integer objects (instead of val % 2 == 0 or val % 2 != 0))    
# can make your codes shorter! Anyways,                                        
                                                                               
a = ''                                                                         # => 
p a.empty?                                                                     # => true
                                                                               
# Or:                                                                          
p a == ''                                                                      # => true
p a.eql?(%!!)                                                                  # => true
                                                                               
a = ' '                                                                        # =>  
p a.empty?                                                                     # => false
                                                                               
# Here's a map preview:                                                        
a = 'hello', 'world', 'this', '', '', 'Ruby'                                   # => ["hello", "world", "this", "", "", "Ruby"]
p a.count('')                                                                  # => 2
p a.count(&:empty?)                                                            # => 2
