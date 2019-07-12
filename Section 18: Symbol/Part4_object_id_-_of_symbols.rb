#!/usr/bin/ruby -w
# Fri Jul 12 17:36:43 2019
# ruby 2.6.3
# Encoding: UTF-8
# PART 4

# The object_id of symbol is unique like Integers and Floats
# This makes them very light weight
# The equal? method can be used to compare object_id as well!
a = :Foo                                                             # => :Foo
b = :Foo                                                             # => :Foo
p a.object_id                                                        # => 1095268
p b.object_id                                                        # => 1095268

p a.object_id == b.object_id                                         # => true
p a.equal?(b)                                                        # => true

# There's no way to modify a or b without changing the object_id!
# In the benchmark section we will compare the performance
