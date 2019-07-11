#!/usr/bin/ruby -w
# PART 3

# We have already seen nested arrays previously ;)
# They are arrays inside arrays!
a = []                                                                                                      # => []
# Sour fruits
a.push(%w(orange lime lemon grapes))                                                                        # => [["orange", "lime", "lemon", "grapes"]]

# Sweet fruits
a.push(%w(banana mangos watermelon peach))                                                                  # => [["orange", "lime", "lemon", "grapes"], ["banana", "mangos", "watermelon", "peach"]]

# Now let's capitalize all the items:
a.map! { |x| x.map(&:capitalize) }                                                                          # => [["Orange", "Lime", "Lemon", "Grapes"], ["Banana", "Mangos", "Watermelon", "Peach"]]

# Speaking of transpose, it's all about matrices!
# a b c
# d e f
# g h i
# j k l

# The transpose will create:
# a d g j
# b e h k
# c f i l

ary = 1.step(10, 3).map { |i| 96.then { |j| (0..2).map.with_index { |x, ind| j + ind + i}.map(&:chr) } }    # => [["a", "b", "c"], ["d", "e", "f"], ["g", "h", "i"], ["j", "k", "l"]]
p ary.transpose                                                                                             # => [["a", "d", "g", "j"], ["b", "e", "h", "k"], ["c", "f", "i", "l"]]

# Let's use the fruit array!
# Let's combine one sweet with one sour ;)
p a                                                                                                         # => [["Orange", "Lime", "Lemon", "Grapes"], ["Banana", "Mangos", "Watermelon", "Peach"]]
print a.transpose                                                                                           # => nil
