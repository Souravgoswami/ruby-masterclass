#!/usr/bin/ruby -w
require_relative(File.join(__dir__, 'codeevaluator'))

puts CodeEvaluator.save_as(
	%w(
		The_true_false_and_nil_objects
		Equality_Operator_(==)_and_Inequality_Operator_(!=)
		Greater_Than_Operator(>)
		Lesser_Than_Operator(<)
		Greater_Than_Equal_Operator_(>=)
		Lesser_Than_Equal_Operator_(<=)
		Truthiness_and_Falsiness_and_not_and_!_Operators
		The_Exclusive_OR_method
		The_-_respond_to?_-_method
	),
	[
		"
			# PART 1
			# As we saw in the odd? and even? methods, there
			# exists true and false objects in Ruby.

			# The true and false objects belong to
			# TrueClass and FalseClass respectively.

			p true.class
			p false.class
			p nil.class
			# As we see it's not False or True, it's FalseClass and
			# TrueClass.
			# There are eager operators like not, !, |, &

			p true | true
			p true | false
			p false | true
			p false | false

			p true & true
			p true & false
			p false & true
			p false & false

			p true.|(true).|(false)
			p true.&(true).&(false)
			",

			"
			# PART 2
			# We can use the equality operator (==) to check if
			# the object that == is called on is equal to the argument
			# or not
 			p 5 == 5
			p 5 == 3
			p 3 == 5 - 2
			p 16.==(2 ** 4)

			p 5 != 5
			p 5 != 3
			p 3 != 5 - 2
			p 16.!=(2 ** 4)
		",

		"
			# PART 3
			# The greater than operator can be used
			# to check if a String or Integer is greater
			# than others
			p 5 > 4
			p 6 > 7
			p 'a' > 'b'
			p 'b' > 'a'

			p 'A'.ord, 'a'.ord
			p 'a'.ord > 'A'.ord
		",

		"
			# PART 4
			# Just like the >, the lesser than operator can be
			# used to check if a String or an Integer object is
			# greater than it's argument

			p 1 < 5
			p 'a' < 'b'
			p STDIN.gets.to_i < 5
		",
		"
			# PART 5
			# The greater than equal operator
			# returns true if the argument is
			# greater than or equal to the self object.
			p 5 >= 5
			# This is just like:
			a = 6
			p a == 5 || a > 5

			# We are checking if 5 is greater than
			# or equal to 5. That means if the argument
			# is 5 or more than 5, >= method will return true
		",
		"
			# PART 6
			# The less than equal operator
			# returns true if the argument is
			# smaller than or equal to the self object.
			p 5 <= 5

			# It's like:
			p STDIN.gets.to_i.then { |a| a < 5 || a == 5 }

			# We are checking if 5 is greater than
			# or equal to 5. That means if the argument
			# is 5 or more than 5, >= method will return true
		",

		"
			# PART 7
			# An object that holds true value, can be referred to
			# as truthy. An object with false or nil value is falsey.

			# We can use the not and ! operators to confirm.
			# The ! and not operators convert any object to either true
			# or false. If they object is truthy, in other words not nil and
			# false, both ! and not will return false, and if the object are
			# falsey, i.e., holds false or nil values, then ! or not operator
			# will return true...

			p !5        # 5 is truthy
			p not(5)

			p !!5        # 5 is truthy, !5 is false, !!5 is true.
			p !not(5)

			p !false        # opposite of false is true
			p not(!false)

			p !!0        # 0 is truthy; !0 is false; !false is true
			p !!1         # 1 is truthy; !1 is false; !false is true

			p !!true
			p !!false
			p !not(nil)
		",

		"
			# PART 8
			# The exclusive or or ^ method is available on
			# objects belonging to  TrueClass, FalseClass
			# NilClass and Integer.
			p true ^ true
			p true ^ false
			p false ^ true
			p false ^ false

			# Odd of true is true ;)
			p false ^ false ^ false
			p false ^ true ^ false
			p false ^ true ^ nil ^ true
			p true ^ true ^ true ^ nil ^ false ^ false ^ nil ^ nil

			p (0..100).map { [true, false, nil].sample }.then { |x| [x.count(true), x.reduce(:^)] }

			# Well it's not used much, but still for fun you can swap values
			# with XOR (only for positive integers)
			a, b = 100, 200

			# We can swap values with `a, b = b, a`. But for fun, let's use XOR:
			a ^= b
			b ^= a
			a ^= b
			p \"a = \#{a}, b = \#{b}\"
		",

		"
			# PART 9
			# Using the respond_to?(:method), you can check
			# if an object responds to the method or not.
			p 5.respond_to?(:odd?)
			p 5.respond_to?('to_s')

			p 5.respond_to?('foo')
			p 5.respond_to?(:respond_to?)

			# Alternatively you can do the following, which we will
			# cover in throughout the Array sections in more details
			p 5.methods.include?(:respond_to?)
		"
	]
) if $PROGRAM_NAME == __FILE__
