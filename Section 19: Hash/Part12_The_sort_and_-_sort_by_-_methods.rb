#!/usr/bin/ruby -w
# Sun Jul 21 04:03:50 2019
# ruby 2.6.3
# Encoding: UTF-8
# PART 12

# The sort methods on a hash object returns an array:
languages = {ruby: :interpreted, crystal: :compiled, perl: :interpreted, python: :intrpreted, c: :compiled, cpp: :compiled, go: :compiled}    # => {:ruby=>:interpreted, :crystal=>:compiled, :perl=>:interpreted, :python=>:intrpreted, :c=>:compiled, :cpp=>:compiled, :go=>:compiled}
p languages.sort    # Alphabetical sort                                                                                                       # => [[:c, :compiled], [:cpp, :compiled], [:crystal, :compiled], [:go, :compiled], [:perl, :interpreted], [:python, :intrpreted], [:ruby, :interpreted]]
p languages.sort_by { |x, y| y <=> x }                                                                                                        # => [[:ruby, :interpreted], [:crystal, :compiled], [:perl, :interpreted], [:python, :intrpreted], [:cpp, :compiled], [:go, :compiled], [:c, :compiled]]
p languages.sort_by { |x, y| x <=> y }                                                                                                        # => [[:c, :compiled], [:ruby, :interpreted], [:crystal, :compiled], [:perl, :interpreted], [:python, :intrpreted], [:cpp, :compiled], [:go, :compiled]]

# Randomizing elements:
p languages.sort_by { rand }                                                                                                                  # => [[:ruby, :interpreted], [:c, :compiled], [:cpp, :compiled], [:crystal, :compiled], [:go, :compiled], [:perl, :interpreted], [:python, :intrpreted]]
p languages.to_a.shuffle                                                                                                                      # => [[:perl, :interpreted], [:go, :compiled], [:cpp, :compiled], [:c, :compiled], [:ruby, :interpreted], [:python, :intrpreted], [:crystal, :compiled]]
