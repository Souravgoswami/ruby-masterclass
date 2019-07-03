#!/usr/bin/ruby -w
# PART 7

# The rand method can generate random numbers!
# In the IO section we will see how these things work!
p rand(1..100)                                            # => 88
p Kernel.rand(1..100)                                     # => 26
p Random.rand(1..100)                                     # => 94

# When you call rand it calls Kernel.rand!
# Random.rand is not Kernel.rand, but it's similar...
# Note that you can't create alphabetical ranges!
# Except:
p 10.times.map { rand(97..122).chr }.join                 # => "mhczftmxtu"
