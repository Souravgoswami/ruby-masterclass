#!/usr/bin/ruby -w
# Fri Jul 12 17:36:43 2019
# ruby 2.6.3
# Encoding: UTF-8
# PART 2

# Symbols are used in place of light weight strings
# We can also declare constants with strings:
Object.const_set(:Apple, 5)                                                  # => 5
p Apple                                                                      # => 5

# For creating methods:
define_method(:hello_world) { |str = 'Hello World'| str }                    # => :hello_world
p hello_world                                                                # => "Hello World"

# For calling methods:
p Object.send(:hello_world, 'Hi!!')                                          # => "Hi!!"
p method(:hello_world).call('Ahoy!')                                         # => "Ahoy!"
p Object.instance_method(:hello_world).bind(Object).call('Hola')             # => "Hola"

# For creating hashes, we will take a deeper look at the hash section:
h = {apple: 5, pineapple: 8, mango: 1}                                       # => {:apple=>5, :pineapple=>8, :mango=>1}
p h                                                                          # => {:apple=>5, :pineapple=>8, :mango=>1}

# And there are other usage, most of which we will be seeing from now on!
