#!/usr/bin/ruby -w
# Encoding: UTF-8
# Sun Jul 21 04:40:33 2019
# ruby 2.6.3
# PART 12

# The sort methods on a hash object returns an array:
languages = {ruby: :interpreted, crystal: :compiled, perl: :interpreted, python: :intrpreted, c: :compiled, cpp: :compiled, go: :compiled}    # => {:ruby=>:interpreted, :crystal=>:compiled, :perl=>:interpreted, :python=>:intrpreted, :c=>:compiled, :cpp=>:compiled, :go=>:compiled}
p languages.sort    # Alphabetical sort                                                                                                       # => [[:c, :compiled], [:cpp, :compiled], [:crystal, :compiled], [:go, :compiled], [:perl, :interpreted], [:python, :intrpreted], [:ruby, :interpreted]]
p languages.sort_by { |x, y| y <=> x }                                                                                                        # => [[:ruby, :interpreted], [:crystal, :compiled], [:perl, :interpreted], [:python, :intrpreted], [:cpp, :compiled], [:go, :compiled], [:c, :compiled]]
p languages.sort_by { |x, y| x <=> y }                                                                                                        # => [[:c, :compiled], [:ruby, :interpreted], [:crystal, :compiled], [:perl, :interpreted], [:python, :intrpreted], [:cpp, :compiled], [:go, :compiled]]

# Randomizing elements:
p languages.sort_by { rand }                                                                                                                  # => [[:ruby, :interpreted], [:crystal, :compiled], [:python, :intrpreted], [:cpp, :compiled], [:c, :compiled], [:perl, :interpreted], [:go, :compiled]]
p languages.to_a.shuffle                                                                                                                      # => [[:ruby, :interpreted], [:cpp, :compiled], [:crystal, :compiled], [:perl, :interpreted], [:python, :intrpreted], [:go, :compiled], [:c, :compiled]]
