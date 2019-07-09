#!/usr/bin/ruby -w
# PART 13

# Now if you want to delete array elements
# You can use pop, delete, delete_at methods.
# The pop method deletes the last item from the array, and
# returns the last value:
a = Array(1..10)                                              # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
p a.pop                                                       # => 10
p a                                                           # => [1, 2, 3, 4, 5, 6, 7, 8, 9]
p a.pop.class                                                 # => Integer

# delete method deletes an item recursively:
a.replace([1,2,3,4,5,6, 5, 6, 4, 1])                          # => [1, 2, 3, 4, 5, 6, 5, 6, 4, 1]
a.delete(6)                                                   # => 6
p a                                                           # => [1, 2, 3, 4, 5, 5, 4, 1]
# it returns nil if the argument is not in the array
p a.delete('a')                                               # => nil

a.concat(('a'..'d').to_a)                                     # => [1, 2, 3, 4, 5, 5, 4, 1, "a", "b", "c", "d"]
p a.delete('a')                                               # => "a"
p a                                                           # => [1, 2, 3, 4, 5, 5, 4, 1, "b", "c", "d"]

# The delete_at method deletes an element at a given index
p a.delete_at(1)                                              # => 2
p a                                                           # => [1, 3, 4, 5, 5, 4, 1, "b", "c", "d"]
