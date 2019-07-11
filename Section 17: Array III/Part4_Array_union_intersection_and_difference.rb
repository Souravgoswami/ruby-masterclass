#!/usr/bin/ruby -w
# PART 4

# Array Union and Intersection...
# There are sets in Ruby, which are just like hashes.
# But you can also think of arrays as sets? Probably...
# You can union an array using the | operator.
# Yes, remember it's not `or` or || as in short circuit evaluator...
# It's array union:
# Imagine combining 2 arrays with the duplicates removed:
a, b = [1, 2, 3, 4, 5, 4], [0, 5, 6, 7, 8, 9, 9]                                        # => [[1, 2, 3, 4, 5, 4], [0, 5, 6, 7, 8, 9, 9]]

p a.concat(b).uniq                                                                      # => [1, 2, 3, 4, 5, 0, 6, 7, 8, 9]
# Well, the above kind of works! But it's very heavy to the processor
# Let's unify the arrays!
p a, b                                                                                  # => [[1, 2, 3, 4, 5, 4, 0, 5, 6, 7, 8, 9, 9], [0, 5, 6, 7, 8, 9, 9]]

p a.dup.concat(b).uniq                                                                  # => [1, 2, 3, 4, 5, 0, 6, 7, 8, 9]
p a.union(b)                                                                            # => [1, 2, 3, 4, 5, 0, 6, 7, 8, 9]
p a.|(b)                                                                                # => [1, 2, 3, 4, 5, 0, 6, 7, 8, 9]

oo_languages = %w(ruby crystal smalltalk perl c++ rust python java)                     # => ["ruby", "crystal", "smalltalk", "perl", "c++", "rust", "python", "java"]
functional_languages = %w(c c++ rust javascript rust java)                              # => ["c", "c++", "rust", "javascript", "rust", "java"]
p oo_languages.dup.concat(functional_languages) | []                                    # => ["ruby", "crystal", "smalltalk", "perl", "c++", "rust", "python", "java", "c", "javascript"]
p oo_languages.union(functional_languages)                                              # => ["ruby", "crystal", "smalltalk", "perl", "c++", "rust", "python", "java", "c", "javascript"]
p oo_languages | functional_languages                                                   # => ["ruby", "crystal", "smalltalk", "perl", "c++", "rust", "python", "java", "c", "javascript"]

[1,2,3].union([2,3,4]).union([5, 6, 7, 9, 8, 2, 3, 4]).sort                             # => [1, 2, 3, 4, 5, 6, 7, 8, 9]

# Intersection only takes the common elements from 2 arrays
p [a, b]                                                                                # => [[1, 2, 3, 4, 5, 4, 0, 5, 6, 7, 8, 9, 9], [0, 5, 6, 7, 8, 9, 9]]
p a.&(b)                                                                                # => [5, 0, 6, 7, 8, 9]
p a & b                                                                                 # => [5, 0, 6, 7, 8, 9]

p [1, 2, 3] & [2, 4, 5]                                                                 # => [2]

# Which is another heavy weight way of achiveing the same task:
p [1, 2, 3].select { |x| [2, 4, 5].include?(x) }                                        # => [2]

berries = %w(blueberry blackberry raspberry cranberry strawberry)                       # => ["blueberry", "blackberry", "raspberry", "cranberry", "strawberry"]
fruits = %w(mango lime lemon cranberry tamarind blueberry jackfruit)                    # => ["mango", "lime", "lemon", "cranberry", "tamarind", "blueberry", "jackfruit"]
p berries & fruits                                                                      # => ["blueberry", "cranberry"]
p berries.select { |x| fruits.include?(x) }                                             # => ["blueberry", "cranberry"]
p berries.+(fruits).then { |a| a.group_by { |x| a.count(x) } }.max[1].uniq              # => ["blueberry", "cranberry"]

# So + concatenates an array with the another arrays passed
# as an argument. * multiplies an array n times:
p [1,2,3] * 3                                                                           # => [1, 2, 3, 1, 2, 3, 1, 2, 3]
p [1,2,3].cycle(3).to_a                                                                 # => [1, 2, 3, 1, 2, 3, 1, 2, 3]

# We are left with / and -. Unfortunately there's no / method :(
# But - can be used for differences:

visit_list = ['Rome', 'Paris', 'Goa', 'France', 'Switzerland', 'Maldives', 'London']    # => ["Rome", "Paris", "Goa", "France", "Switzerland", "Maldives", "London"]
visited = ['Paris', 'Goa', 'London']                                                    # => ["Paris", "Goa", "London"]

p yet_to_visit = visit_list - visited                                                   # => ["Rome", "France", "Switzerland", "Maldives"]

shop_list = %w(Soap Rice Noodles Chillies Potatoes Milk Desserts Candies)               # => ["Soap", "Rice", "Noodles", "Chillies", "Potatoes", "Milk", "Desserts", "Candies"]
shopped = %w(Chillies Potatoes Noodles Milk Candies)                                    # => ["Chillies", "Potatoes", "Noodles", "Milk", "Candies"]
yet_to_shop = shop_list - shopped                                                       # => ["Soap", "Rice", "Desserts"]
p yet_to_shop                                                                           # => ["Soap", "Rice", "Desserts"]
