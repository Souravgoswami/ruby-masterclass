#!/usr/bin/ruby -w
# PART 10

# The select! method also modifies the original array
# without modifying the object_id:
fruits = ['Green Apple', 'Strawberry', 'Banana', 'Blueberry', 'Raspberry', 'Cranberry', 'Pineapple', 'Blackberry']    # => ["Green Apple", "Strawberry", "Banana", "Blueberry", "Raspberry", "Cranberry", "Pineapple", "Blackberry"]

# Select doesn't modify the array. What if we need to work only with berries?
fruits.select { |x| x.end_with?('berry') }                                                                            # => ["Strawberry", "Blueberry", "Raspberry", "Cranberry", "Blackberry"]
p fruits                                                                                                              # => ["Green Apple", "Strawberry", "Banana", "Blueberry", "Raspberry", "Cranberry", "Pineapple", "Blackberry"]

fruits.select! { |x| x.end_with?('berry') }                                                                           # => ["Strawberry", "Blueberry", "Raspberry", "Cranberry", "Blackberry"]
p fruits                                                                                                              # => ["Strawberry", "Blueberry", "Raspberry", "Cranberry", "Blackberry"]

# The reject method will reject items:
fruits = ['Green Apple', 'Strawberry', 'Banana', 'Blueberry', 'Raspberry', 'Cranberry', 'Pineapple', 'Blackberry']    # => ["Green Apple", "Strawberry", "Banana", "Blueberry", "Raspberry", "Cranberry", "Pineapple", "Blackberry"]
p fruits.reject { |x| x.end_with?('berry') }                                                                          # => ["Green Apple", "Banana", "Pineapple"]

# Like the select! method, the reject! method also modifies the original array
# without modifying the object_id
fruits.reject! { |x| x.end_with?('berry') }                                                                           # => ["Green Apple", "Banana", "Pineapple"]
p fruits                                                                                                              # => ["Green Apple", "Banana", "Pineapple"]

# The drop method deletes n items from the beginning and return self:
fruits.concat(%w(guava watermelon lime cherry peach).map(&:capitalize))                                               # => ["Green Apple", "Banana", "Pineapple", "Guava", "Watermelon", "Lime", "Cherry", "Peach"]
p fruits.drop(2)    # two items have been shifted                                                                     # => ["Pineapple", "Guava", "Watermelon", "Lime", "Cherry", "Peach"]
p fruits                                                                                                              # => ["Green Apple", "Banana", "Pineapple", "Guava", "Watermelon", "Lime", "Cherry", "Peach"]

# The difference with shift is that drop doesn't modify the original array
# and drop returns the array itself while shift returns the items that have been dropped
p fruits.shift(2)                                                                                                     # => ["Green Apple", "Banana"]

# drop_while method drops the item when the condition in block evaluates to true:
p fruits                                                                                                              # => ["Pineapple", "Guava", "Watermelon", "Lime", "Cherry", "Peach"]
p fruits.drop_while { |x| puts x }                                                                                    # => ["Pineapple", "Guava", "Watermelon", "Lime", "Cherry", "Peach"]
