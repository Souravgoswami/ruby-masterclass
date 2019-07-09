#!/usr/bin/ruby -w
# PART 11

# The reverse method reverses an array!
a = %W\hello #{5} World\ + [false, true, nil, String]    # => ["hello", "5", "World", false, true, nil, String]
p a.reverse                                              # => [String, nil, true, false, "World", "5", "hello"]
p a                                                      # => ["hello", "5", "World", false, true, nil, String]
p a.object_id                                            # => 47043995305380

p a.reverse!                                             # => [String, nil, true, false, "World", "5", "hello"]
p a                                                      # => [String, nil, true, false, "World", "5", "hello"]
p a.object_id                                            # => 47043995305380
