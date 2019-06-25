#!/usr/bin/ruby -w                                         
# PART 12                                                  
# The clear method clears a string without changing        
# the object id. It's a good practice not to change the    
# object id in case of strings, arrays, hashes, etc...     
a = 'hello'                                                # => hello
p a.object_id                                              # => 47307195449160
a.clear                                                    # => 
p a                                                        # => ""
p a.object_id                                              # => 47307195449160
                                                           
# Bad practice                                             
a = 'hello'                                                # => hello
p a.object_id                                              # => 47307195447160
a = ''                                                     # => 
p a                                                        # => ""
p a.object_id                                              # => 47307195446420
                                                           
# The replace method changes a string without              
# changing the obect id. You should use it when            
# you need to change a string                              
                                                           
name = 'Sally'                                             # => Sally
p name.object_id                                           # => 47307195444760
name.replace('Jessie')                                     # => Jessie
p name                                                     # => "Jessie"
p name.object_id                                           # => 47307195444760
                                                           
# This is a bad practice                                   
name = 'Sally'                                             # => Sally
p name.object_id                                           # => 47307195442700
name = 'Jessie'                                            # => Jessie
p name                                                     # => "Jessie"
p name.object_id                                           # => 47307195441960
                                                           
# You can replace the `replace` method with                
# `str.clear.concat` method chain! But that                
# involves some extra hooks. And it's better to            
# use `replace` straight away                              
name = 'Jesscar'                                           # => Jesscar
p name.object_id                                           # => 47307195473020
name.clear.concat('Sheida')                                # => Sheida
p name                                                     # => "Sheida"
p name.object_id                                           # => 47307195473020
