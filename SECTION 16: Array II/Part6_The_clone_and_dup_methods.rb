#!/usr/bin/ruby -w
# PART 6

# The clone and dup method duplicates an array
# dup doesn't preserve frozen state of an array
# dup doesn't creates duplicates of the singleton methods
# We will see the difference later!

a = [1,2,3,4,5]                                              # => [1, 2, 3, 4, 5]
p a                                                          # => [1, 2, 3, 4, 5]

x = a                                                        # => [1, 2, 3, 4, 5]
x.push(100_000, 200_000, 300_000)                            # => [1, 2, 3, 4, 5, 100000, 200000, 300000]
p a                                                          # => [1, 2, 3, 4, 5, 100000, 200000, 300000]
p x                                                          # => [1, 2, 3, 4, 5, 100000, 200000, 300000]

# So we see modifying x modifies a as well
# let's delete some items of c
a.pop(3)                                                     # => [100000, 200000, 300000]

b = a.dup                                                    # => [1, 2, 3, 4, 5]
c = a.clone                                                  # => [1, 2, 3, 4, 5]

p a.object_id                                                # => 47311897621480
p b.object_id                                                # => 47311897617280
p c.object_id                                                # => 47311897616680

b.push(1000)                                                 # => [1, 2, 3, 4, 5, 1000]
c.push(1500)                                                 # => [1, 2, 3, 4, 5, 1500]

p a                                                          # => [1, 2, 3, 4, 5]
p b                                                          # => [1, 2, 3, 4, 5, 1000]
p c                                                          # => [1, 2, 3, 4, 5, 1500]

# Now consider strings:
foo = 'Tom'                                                  # => "Tom"
bar = foo                                                    # => "Tom"
bar.concat(' + Jerry')                                       # => "Tom + Jerry"
p bar                                                        # => "Tom + Jerry"
p foo                                                        # => "Tom + Jerry"

# Ok let's dup the foo:
foo = 'Tom'                                                  # => "Tom"
bar = foo.dup                                                # => "Tom"
bar.concat(' + Jerry')                                       # => "Tom + Jerry"
p bar                                                        # => "Tom + Jerry"
p foo                                                        # => "Tom"

# now let's do it with clone:
foo = 'Tom'                                                  # => "Tom"
bar = foo.clone                                              # => "Tom"
bar.concat(' + Jerry')                                       # => "Tom + Jerry"
p bar                                                        # => "Tom + Jerry"
p foo                                                        # => "Tom"

# foo = 'Tom'.freeze
# bar = foo.clone
# bar.concat(' + Jerry')    # FrozenError
# p bar
# p foo
