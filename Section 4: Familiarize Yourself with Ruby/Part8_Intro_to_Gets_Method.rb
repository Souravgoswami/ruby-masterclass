# The gets method can be used to get values from a string.             
p gets                                                                 # => hello

                                                                       
# This above gets is from module Kernel                                
p method(:gets).owner                                                  # => Kernel
p Kernel.gets                                                          # => hello

                                                                       
# STDIN.gets and $stdin.gets are similar.                              
# I think you all should use either STDIN.gets or $stdin.gets ;)       
p STDIN.gets                                                           # => hello

p $stdin.gets                                                          # => hello

