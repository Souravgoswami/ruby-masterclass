#!/usr/bin/ruby -w                                                 
# PART 11                                                          
# A [n] after a string and array will return the n object          
# A [0] after a string or an array will return the first object    
# A [-1] after a string and array will return the last object      
# A [n..n] refers to a range after a string or array.              
                                                                   
a = 'Ruby is ostentatious!'                                        # => Ruby is ostentatious!
                                                                   
p a[0]                                                             # => "R"
p a[1]                                                             # => "u"
p a[-2]                                                            # => "s"
p a[-6]                                                            # => "t"
p a[0..3]                                                          # => "Ruby"
p a[-1]                                                            # => "!"
p a[0, 4]                                                          # => "Ruby"
