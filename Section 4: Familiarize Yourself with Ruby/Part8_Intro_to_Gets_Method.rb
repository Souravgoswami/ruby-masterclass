# The gets method can be used to get values from a string.                      
p gets                                                                          # => Batman

                                                                                
# This above gets is from module Kernel                                         
p method(:gets).owner                                                           # => Kernel
p Kernel.gets                                                                   # => Batwoman

                                                                                
# STDIN.gets and $stdin.gets are similar.                                       
# I think you all should use either STDIN.gets or $stdin.gets ;)                
# Method chomp on string will remvoe the new line character!                    
p STDIN.gets.chomp                                                              # => Superman
                                                                                
# Strip will remove spaces, tabs, new line characters after and before          
p $stdin.gets.strip                                                             # => Supergirl
                                                                                
# The methods .lstrip and rstrip will remove spaces, new line characters,       
# tabs from the left and right respectively.                                    
var = "\t\nSuperman\t\n"                                                        # => 	
Superman	

p var.strip                                                                     # => Superman
p var.lstrip                                                                    # => Superman	

p var.rstrip                                                                    # => 	
Superman
p var.chomp                                                                     # => 	
Superman	
                                                                                
# Chop will remove the last character                                           
p var.chop                                                                      # => 	
Superman	
