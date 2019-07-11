#!/usr/bin/ruby -w
# PART 9

#    The permutation method permutates an array
# It returns an enumerator.
# We can chain the to_a method to convert all the
# possible arrangements into an array:
a = [1, 2, 3]                                        # => [1, 2, 3]

p a.permutation.class                                # => Enumerator
print a.permutation.methods.sort                     # => nil
p a.permutation                                      # => #<Enumerator: [1, 2, 3]:permutation>
p a.permutation.to_a                                 # => [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]

# the permutation method also accept a argument
p a.permutation(2).to_a                              # => [[1, 2], [1, 3], [2, 1], [2, 3], [3, 1], [3, 2]]
p a.permutation.to_a.map { |x| x.first(2) }          # => [[1, 2], [1, 3], [2, 1], [2, 3], [3, 1], [3, 2]]

p a.permutation { |x| puts x }                       # => [1, 2, 3]
p a.permutation.take(2)                              # => [[1, 2, 3], [1, 3, 2]]
p a.permutation.take(100)                            # => [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]

# The combination method returns the combination
# that can be formed with the array element.
# It takes one mandatory parameter:
p a.combination(2).to_a                              # => [[1, 2], [1, 3], [2, 3]]
p a.combination(3).to_a                              # => [[1, 2, 3]]
p a.combination(1).to_a                              # => [[1], [2], [3]]
