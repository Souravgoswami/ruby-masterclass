#!/usr/bin/ruby -w
# PART 6

# The & and | are methods on some of the objects in Ruby.
# The &&, ||, or are short-circuit operators

# In case of short-circuit evaluators the second argument
# is evaluated only if the first argument succeeds of fails.

# Let's look at & first
# returns true if both the caller object and argument are true
puts 'The & method'
puts true & true    # => true
puts false & true    # => false because false is falsey
puts true & false    # => false because true is truthy
puts false & false

puts '-' * 10

puts 'The && operator'
puts true && true    # => true
puts false && true    # => false because false is falsey
puts true && false    # => false because true is truthy
puts false && false

puts '-' * 10

puts 'The and operator'
puts true and true    # => true
puts false and true    # => false because false is falsey
puts true and false    # => true because true is truthy
puts false and false    # => false

puts '-' * 10

puts 'The | method'
puts true | true    # => true
puts false | false    # => false because the last value is false
puts true | false    # => true because the first value is true, and it can't return false
puts false | false    # => false because the last value is false

puts '-' * 10

puts 'The || operator'
puts true || true    # => true
puts false || false    # => false because the last value is false
puts true || false    # => true because the first value is true, and it can't return false
puts false || false    # => false because the last value is false

puts '-' * 10

puts 'The or operator'
puts true or true    # => true
puts false or false    # => false because the last value is false
puts true or false    # => true because the first value is true, and it can't return false
puts false or false    # => false because the last value is false

puts '-' * 10

# Now let's take a deeper look at and:
puts true and 'hello'    # true, it returns the first value
puts false and 'hello'    # false, it returns the first value
puts 'hello' and 'hi'    # 'hello'
puts 5 and 'hi'    # => 5

puts '-' * 10
# Now let's take a deeper look at or
puts true or 'hello'            # => it also returns the first value
puts false or 'hello'            # => it also returns the first value
puts 'hello' and 'hi'            # => it also returns the first value
puts 5 and 'hi'            # => it also returns the first value

puts '-' *10

# Now let's take a deeper look at &&
puts true && 'hello'            # => it returns the last value if the first object is truthy or true
puts false && 'hello'            # => it returns the last value if the first object is truthy or true
puts 'hello' && 'hi'            # => it returns the last value if the first object is truthy or true
puts 5 && 'hi'            # => it returns the last value if the first object is truthy or true

puts '-' * 10

# Now let's take a deeper look at ||
puts true || 'hello'            # it returns the last object unless the first object is true or truthy. Just the opposite of &&
puts false || 'hello'            # it returns the last object unless the first object is true or truthy. Just the opposite of &&
puts 'hello' || 'hi'            # it returns the last object unless the first object is true or truthy. Just the opposite of &&
puts 5 && 'hi'            # it returns the last object unless the first object is true or truthy. Just the opposite of &&

puts '-' * 10

# Another example:
puts('Type Something: ') || (a = STDIN.gets.to_s.strip) && puts(a + '!')
# The puts method returns nil, which is falsey, so || is used, in such case `nil || (a = ...` is interpreted
# The (a = STDIN.gets.to_s.strip) returns a string, which is truthy.
# In such case, `true && puts(...` is interpreted
# You see now, short-circuit evaluators can replace long codes, but it shouldnt't be used much!

# Also note that, the & method is only available on Integer (Bitwise AND) and TrueClass, FalseClass, NilClass,
# and Array (intersection). And could be on other objects, but that's not like &&, and operators which are
# available everywhere (again, not as methods)

# The | method is also available on Integer (Bitwise OR), TrueClass, FalseClass, NilClass, and Array (set union)
# This is a method, and not a short-circuit evaluator like || or `or`
