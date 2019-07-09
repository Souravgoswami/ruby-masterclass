#!/usr/bin/ruby -w
# PART 14

# The shift method delete an element from the beginning of an array:
a = %w( java python perl ruby crystal)                                  # => ["java", "python", "perl", "ruby", "crystal"]
p a                                                                     # => ["java", "python", "perl", "ruby", "crystal"]
a.shift                                                                 # => java
p a                                                                     # => ["python", "perl", "ruby", "crystal"]
2.times { a.shift }                                                     # => 2
p a                                                                     # => ["ruby", "crystal"]

# The unshift method appends an item to the beginning of the array:
compiled_languages = %w(c# rust go crystal javascript)                  # => ["c#", "rust", "go", "crystal", "javascript"]
p compiled_languages.unshift('c', 'c++').pop                            # => "javascript"
p compiled_languages                                                    # => ["c", "c++", "c#", "rust", "go", "crystal"]
