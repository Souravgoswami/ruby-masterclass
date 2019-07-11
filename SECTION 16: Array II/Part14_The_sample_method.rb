#!/usr/bin/ruby -w
# PART 14

# The sample method select random element(s) from an array!
a = %w(there are water drops in the air)                             # => ["there", "are", "water", "drops", "in", "the", "air"]

p a.sample                                                           # => "the"
# Which is equivalent to
p a[rand(0...a.size)]                                                # => "are"

p a.sample(2)                                                        # => ["there", "water"]
p a.sample(4).join(' ')                                              # => "drops water are there"

p [1, 2, 3].sample                                                   # => 3

a = [1, 2, 3]                                                        # => [1, 2, 3]
p a.sample                                                           # => 2

p srand                                                              # => 54715040081987068281555162559541810870
p a[srand % 3]                                                       # => 3

# You should use sample method, because it's very light weight
# It's very secure for cryptography as well.
# If you are doing very sensitive work, you may read /dev/urandom
# directly to make sure you are doing the correct job!
