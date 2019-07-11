#!/usr/bin/ruby -w
# PART 2

# The freeze method is available on all the objects!
# For example:
a = 'Str'.freeze                                                        # => "Str"
# a.concat('hello')    # => FrozenError

a = ['Raspberry Pi', 'Orange Pi', 'Banana Pi']                          # => ["Raspberry Pi", "Orange Pi", "Banana Pi"]
a.freeze                                                                # => ["Raspberry Pi", "Orange Pi", "Banana Pi"]
# a.push('Custard Pie')    # can't modify frozen Array (FrozenError)

# That said you can't modify frozen objects!
# Yes you ca reassign them!
p a.frozen?                                                             # => true
p a.object_id                                                           # => 47336719857160

p a = a + ['Custard Pie']                                               # => ["Raspberry Pi", "Orange Pi", "Banana Pi", "Custard Pie"]

p a.frozen?                                                             # => false
p a.object_id                                                           # => 47336719853560
