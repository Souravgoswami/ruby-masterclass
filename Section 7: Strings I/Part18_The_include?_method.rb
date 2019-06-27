#!/usr/bin/ruby -w                                            
# PART 18                                                     
# The squeeze and squeeze! methods removes duplicates from    
# a string if they occur right next ot each other!            
a = 'Ruby or sapphire?!'                                      # => Ruby or sapphire?!
                                                              
p a.squeeze                                                   # => "Ruby or saphire?!"
p a                                                           # => "Ruby or sapphire?!"
                                                              
p a.squeeze!                                                  # => "Ruby or saphire?!"
p a                                                           # => "Ruby or saphire?!"
                                                              
p 'Mooooonday!'.squeeze                                       # => "Monday!"
