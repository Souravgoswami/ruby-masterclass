#!/usr/bin/ruby -w
# PART 4

# The %w or %W syntaxes can be used to crate arrays containing
# strings:
a = %w(hello world#{5} this is a single quoted splitted string)                                                   # => ["hello", "world\#{5}", "this", "is", "a", "single", "quoted", "splitted", "string"]
p a[2..-1]                                                                                                        # => ["this", "is", "a", "single", "quoted", "splitted", "string"]

# The above is quite similar to:
p 'hello world#{5} this is a single quoted splitted string'.split                                                 # => ["hello", "world\#{5}", "this", "is", "a", "single", "quoted", "splitted", "string"]

# The next one is %W:
p %W(hello world#{5} this is a double quoted splitted string)                                                     # => ["hello", "world5", "this", "is", "a", "double", "quoted", "splitted", "string"]
p "hello world#{5} this is a double quoted splitted string".split                                                 # => ["hello", "world5", "this", "is", "a", "double", "quoted", "splitted", "string"]

# This is a quick way to create arrays:
puts %W(\xF0\x9F\x95\x9B \xF0\x9F\x95\x90 \xF0\x9F\x95\x91 \xF0\x9F\x95\x92 \xF0\x9F\x95\x93 \xF0\x9F\x95\x94)    # => nil
