#!/usr/bin/ruby -w
# PART 1

# The take method picks up one or more elements from
# an array, and returns another array.
a = %w(apple banana grapes pineapple blueberry)                # => ["apple", "banana", "grapes", "pineapple", "blueberry"]

p a.take(2)                                                    # => ["apple", "banana"]
p a.take(1)                                                    # => ["apple"]
p a.take(0)                                                    # => []
p a.take(100)                                                  # => ["apple", "banana", "grapes", "pineapple", "blueberry"]
# p a.take(-1)    # ArgumentError

# In contrast to drop, which drops the first n elements and
# returns the rest ones
p a.drop(2)                                                    # => ["grapes", "pineapple", "blueberry"]
p a.take(2)                                                    # => ["apple", "banana"]
