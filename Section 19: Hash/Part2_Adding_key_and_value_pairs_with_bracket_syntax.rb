#!/usr/bin/ruby -w
# Encoding: UTF-8
# Sun Jul 21 05:10:12 2019
# ruby 2.7.0
# PART 2

# This is a redundant section that focuses on adding key-value pairs in more detail:
# It's very common to see symbols used as hash keys:
elements = {:a => 'Argon', :b => 'Boron', :c => 'Chromium', :d => 'Dubnium', :e => 'Erbium'}    # => {:a=>"Argon", :b=>"Boron", :c=>"Chromium", :d=>"Dubnium", :e=>"Erbium"}
p elements[:a]                                                                                  # => "Argon"
p elements[:d]                                                                                  # => "Dubnium"

# But we have another syntax for symbols only!
elements = {h: 'Helium', n: 'Neon', a: 'Argon', k: 'Krypton', x: 'Xenon'}                       # => {:h=>"Helium", :n=>"Neon", :a=>"Argon", :k=>"Krypton", :x=>"Xenon"}
p elements[:h]                                                                                  # => "Helium"
p elements[:x]                                                                                  # => "Xenon"

# Now let's use the bracket syntax:
elements[:r] = 'Radon'                                                                          # => "Radon"
p elements                                                                                      # => {:h=>"Helium", :n=>"Neon", :a=>"Argon", :k=>"Krypton", :x=>"Xenon", :r=>"Radon"}
p elements[:r]                                                                                  # => "Radon"
