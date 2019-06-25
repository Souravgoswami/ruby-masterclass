#!/usr/bin/ruby -w                                                          
# PART 2                                                                    
# String interpolation allows us to insert a value, a                       
# variable, or a constant inside a string:                                  
                                                                            
# You have to use the soft quotes(""), %Q or % syntax                       
# or it will not show the literal inside the #{}                            
p "Hi#{5}"                                                                  # => "Hi5"
p %Q{Hi#{5}}                                                                # => "Hi5"
p %/Hi#{5}/                                                                 # => "Hi5"
                                                                            
p 'Hi #{5}'                                                                 # => "Hi \#{5}"
p %q{Hi#{5}}                                                                # => "Hi\#{5}"
                                                                            
# The to_s method is needed if you are running this in say, atom runner!    
print 'Enter your name please: '                                            # => nil
p "Hello, #{STDIN.gets.to_s.strip}"                                         # => "Hello, Sally Green"
