#!/usr/bin/ruby -w                                                                          
# PART 3                                                                                    
# Escape characters follows a backslash and then a code.                                    
# You have to use either "" or %Q or % syntax.                                              
# For example:                                                                              
puts "A tab:\t.Code: \\t"                                                                   # => nil
puts "A newline:\n. Code: \\n"                                                              # => nil
puts "A space:\s. Code: \\s"                                                                # => nil
puts "A backspace\b. Code: \\b"                                                             # => nil
puts "A carriage return\r. Code: \\r"                                                       # => nil
puts "\e[1;34mA colour\e[0m\s. Code: \\e[1;34m"                                             # => nil
puts "This is a Unicode: \u263a. Code: \\u263a"                                             # => nil
puts "This is hex code for another unicode: \xF0\x9F\x98\x81. Code \\xF0\\x9F\\x98\\x81"    # => nil
puts "This is a font \xf0\x9d\x94\x9e. Code: \\xf0\\x9d\\x94\\x9e"                          # => nil
