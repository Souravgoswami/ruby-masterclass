#!/usr/bin/ruby -w
# PART 4

a = Array.new(10, &:next)                                                 # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
p a.map { |x| puts x }                                                    # => [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
p a.map { |x| x.next }                                                    # => [2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
p a.map(&:next)                                                           # => [2, 3, 4, 5, 6, 7, 8, 9, 10, 11]

p a.map { |x| "File_#{x}.rb"}                                             # => ["File_1.rb", "File_2.rb", "File_3.rb", "File_4.rb", "File_5.rb", "File_6.rb", "File_7.rb", "File_8.rb", "File_9.rb", "File_10.rb"]
#.each { |f| File.write(File.join(__dir__, f), '#!/usr/bin/ruby -w') }

# We will dive deeper into these stuff a bit later!

# The collect method is same as map:
a.collect { |x| x.to_s }                                                  # => ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
a.collect(&:next)                                                         # => [2, 3, 4, 5, 6, 7, 8, 9, 10, 11]

# There's a bang method that replaces the original array:
p [a, a.object_id]                                                        # => [[1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 47311897565600]
a.map!(&:to_s)                                                            # => ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
p [a, a.object_id]                                                        # => [["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"], 47311897565600]

a.collect!(&:to_i)                                                        # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
p [a, a.object_id]                                                        # => [[1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 47311897565600]
