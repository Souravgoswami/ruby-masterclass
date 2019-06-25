#!/usr/bin/ruby -w                              
# PART 13                                       
# The slice method works like bracket syntax    
# But it's a method on string                   
a = 'I love the Ruby programming language'      # => I love the Ruby programming language
p a[0]                                          # => "I"
p a.slice(0)                                    # => "I"
                                                
p a[2..5]                                       # => "love"
p a.slice(2..5)                                 # => "love"
                                                
p a[7, 3]                                       # => "the"
p a.slice(7, 3)                                 # => "the"
                                                
# You got it! It's very convenient when         
# You                                           
                                                
a[/love/]                                       # => love
a.slice(/love/)                                 # => love
                                                
p a[/[aeiouAEIOU]/]                             # => "I"
p 'Ruby Rocks!'.slice(/[aeiouAEIOU](..)/)       # => "uby"
