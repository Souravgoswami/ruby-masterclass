#!/usr/bin/ruby -w
# PART 5

# The include method can be used to check if the range
# includes something or not:
a = 1..5                                                  # => 1..5
p a.include?(5)                                           # => true
p a.include?(6)                                           # => false
p a.include?('a')                                         # => false
all = ('a'..'zzzz')                                       # => a..zzzz

p all.count                                               # => 475254
p all.include?('nice')                                    # => true
p all.include?('hair')                                    # => true
p all.include?('xdg')                                     # => true
p all.include?('ruby')                                    # => true
