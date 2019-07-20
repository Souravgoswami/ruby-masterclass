#!/usr/bin/ruby -w
# Encoding: UTF-8
# Sun Jul 21 05:10:13 2019
# ruby 2.7.0
# PART 15

# The select and reject methods
hash = {'192.168.2.3' => 'archlinux', '192.168.2.6' => 'OpenSUSE'}                  # => {"192.168.2.3"=>"archlinux", "192.168.2.6"=>"OpenSUSE"}
hash.reject { |x, y| y == 'archlinux' }                                             # => {"192.168.2.6"=>"OpenSUSE"}
p hash                                                                              # => {"192.168.2.3"=>"archlinux", "192.168.2.6"=>"OpenSUSE"}

# The reject! method modifies the original hash but doesn't
# change the memory location
p hash.reject! { |x, y| y == 'OpenSUSE' }                                           # => {"192.168.2.3"=>"archlinux"}
p hash                                                                              # => {"192.168.2.3"=>"archlinux"}

hash.replace({'192.168.2.3' => 'a', '192.168.2.6' => 'b', '192.169.2.8' => 'c'})    # => {"192.168.2.3"=>"a", "192.168.2.6"=>"b", "192.169.2.8"=>"c"}
# The select method select an item from the hash
p hash.select { |x| x.start_with? '192.168' }                                       # => {"192.168.2.3"=>"a", "192.168.2.6"=>"b"}
p hash                                                                              # => {"192.168.2.3"=>"a", "192.168.2.6"=>"b", "192.169.2.8"=>"c"}

# The select! method modifies the original hash:
p hash.select! { |x| x.start_with?('192.168') }                                     # => {"192.168.2.3"=>"a", "192.168.2.6"=>"b"}
p hash                                                                              # => {"192.168.2.3"=>"a", "192.168.2.6"=>"b"}

# Another example:
a = {1 => 'ruby', 2 => 'python', 3 => 'perl', 4 => 'rust', 5 => 'racket'}           # => {1=>"ruby", 2=>"python", 3=>"perl", 4=>"rust", 5=>"racket"}
p a.select { |_, n| n.start_with?('r') }                                            # => {1=>"ruby", 4=>"rust", 5=>"racket"}
