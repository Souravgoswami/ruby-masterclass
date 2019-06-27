#!/usr/bin/ruby -w

# In Ruby, every single method returns something.
# It could be an Array, a Hash, a String, an Integer, a Float, objects
# A set, a struct, an Image object, a font, or anything!
# or a true, false, nil values. Or a class, or module, or anything!
# It could be Integer, Float, objects
# So for example

def foo
	return 5
end

# The last interpreted value in a method is returned
# So, the above is equivalent to
def bar
	5
end

define_method(:baz) { 5 }
define_method(:qux) { |*a| a }

p foo    # => 5
p bar    # => 5
p baz    # => 5
p qux(%q(Hi), %Q{5})    # => ["Hi", "5"]
