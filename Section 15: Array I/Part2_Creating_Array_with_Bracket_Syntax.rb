#!/usr/bin/ruby -w
# PART 2

# A literal Array can be created in many ways
a = ['Hello', true, 0, false, nil, Class.new { define_singleton_method(:x) { 5 } } ]    # => ["Hello", true, 0, false, nil, #<Class:0x000055929133c268>]
p a                                                                                     # => ["Hello", true, 0, false, nil, #<Class:0x000055929133c268>]
p a[0]                                                                                  # => "Hello"
p a[0..2]                                                                               # => ["Hello", true, 0]
p a[1, 2]                                                                               # => [true, 0]
p a[1, 3]                                                                               # => [true, 0, false]
p a[-1].x                                                                               # => 5

# We can even omit the braces:
a = ['Hello', true, 0, false, nil, Class.new { define_singleton_method(:x) { 5 } }]     # => ["Hello", true, 0, false, nil, #<Class:0x00005592913703d8>]
p a                                                                                     # => ["Hello", true, 0, false, nil, #<Class:0x00005592913703d8>]

a = []                                                                                  # => []
a[5] = 'hello'                                                                          # => hello
p a                                                                                     # => [nil, nil, nil, nil, nil, "hello"]
