#!/usr/bin/ruby -w                                                             
# PART 16                                                                      
# The chomp method, we used earlier, is used to strip off the extra newline    
# character at the end of a string:                                            
p "a\n\n\n".chomp                                                              # => "a\n\n"
p "Ruby!".chomp                                                                # => "Ruby!"
                                                                               
# chop method chops out the last character:                                    
p "a\n\n\n".chomp                                                              # => "a\n\n"
p "Ruby!".chop                                                                 # => "Ruby"
                                                                               
# The strip method removes trailing white space, new line,                     
# tab, form feed, carriage return characters from both                         
# right and left side of the string                                            
p " \n\t\fRuby!\n\t\f\r ".strip                                                # => "Ruby!"
p "Ruby!".strip                                                                # => "Ruby!"
                                                                               
# The lstrip method only strips the trailing left whitespace:                  
p " \n\t\fRuby!\n\t\f\r ".lstrip                                               # => "Ruby!\n\t\f\r "
                                                                               
# The rstrip method only strips the trailing right whitespace                  
p " \n\t\fRuby!\n\t\f\r ".rstrip                                               # => " \n\t\fRuby!"
                                                                               
# They all have bang methods!                                                  
a =  " \n\t\fRuby!\n\t\f\r "                                                   # =>  
	Ruby!
	 
p a.lstrip!                                                                    # => "Ruby!\n\t\f\r "
p a.rstrip!                                                                    # => "Ruby!"
p a.strip!                                                                     # => nil
p a.chomp!                                                                     # => nil
p a.chop!                                                                      # => "Ruby"
