#!/usr/bin/ruby -w
# PART 1

# A range is created (as we have seen in Section 9 -> 10, 11)
# by putting two Integer or Float in () seperated with either
# .. or ...
p (1..9).class                                                         # => Range
# p 1..9.class    # Error here

p ('a'..'z')    # Alphabetical Range                                   # => "a".."z"
p ('a'..'f').to_a                                                      # => ["a", "b", "c", "d", "e", "f"]
p ('a'...'f').to_a                                                     # => ["a", "b", "c", "d", "e"]
p (100..1).to_a                                                        # => []

# A numerical range is simply created like this: (int..last_int)
# The to_a method converts a Range into an Array!
p (0..9).to_a                                                          # => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
p (0...9).to_a                                                         # => [0, 1, 2, 3, 4, 5, 6, 7, 8]

# Or we can use:
p Range.new(1, 5)                                                      # => 1..5
p Range.new('a', 'h').to_a                                             # => ["a", "b", "c", "d", "e", "f", "g", "h"]

# Well, we can even create ranges in most of the languages
p Range.new('খ', 'চ').to_a                                             # => ["খ", "গ", "ঘ", "ঙ", "চ"]
p Range.new('ख', 'च').to_a                                             # => ["ख", "ग", "घ", "ङ", "च"]

# So that's a shortcut while creating an Array.
# But Ranges can do a lot of works we will be seeing
# thoroughout the course!

# The last and complementary end method returns the
# last value of the range whether it excludes end (...) or not (..)
p (1..9).last                                                          # => 9
p (1...9).last                                                         # => 9

p Range.new('খ', 'চ').last                                             # => "চ"
p Range.new('খ', 'চ').end                                              # => "চ"

p (1..9).end                                                           # => 9
p (1...9).end                                                          # => 9

p ('a'..'z').end                                                       # => "z"

p ('a'..'zzz').then { |x| x.end == x.last }                            # => true
p ('a'...'zzz').then { |x| x.end == x.last }                           # => true
