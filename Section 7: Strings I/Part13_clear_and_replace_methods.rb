#!/usr/bin/ruby -w                                         
# PART 13                                                  
# The clear method clears a string without changing        
# the object id. It's a good practice not to change the    
# object id in case of strings, arrays, hashes, etc...     
a = 'hello'                                                # => hello
p a.object_id                                              # => 46990851698280
a.clear                                                    # => 
p a                                                        # => ""
p a.object_id                                              # => 46990851698280
                                                           
# Bad practice                                             
a = 'hello'                                                # => hello
p a.object_id                                              # => 46990851696280
a = ''                                                     # => 
p a                                                        # => ""
p a.object_id                                              # => 46990851695540
                                                           
# The replace method changes a string without              
# changing the obect id. You should use it when            
# you need to change a string                              
                                                           
name = 'Sally'                                             # => Sally
p name.object_id                                           # => 46990851718420
name.replace('Jessie')                                     # => Jessie
p name                                                     # => "Jessie"
p name.object_id                                           # => 46990851718420
                                                           
# This is a bad practice                                   
name = 'Sally'                                             # => Sally
p name.object_id                                           # => 46990851716360
name = 'Jessie'                                            # => Jessie
p name                                                     # => "Jessie"
p name.object_id                                           # => 46990851715620
                                                           
# You can replace the `replace` method with                
# `str.clear.concat` method chain! But that                
# involves some extra hooks. And it's better to            
# use `replace` straight away                              
name = 'Jesscar'                                           # => Jesscar
p name.object_id                                           # => 46990851713940
name.clear.concat('Sheida')                                # => Sheida
p name                                                     # => "Sheida"
p name.object_id                                           # => 46990851713940
