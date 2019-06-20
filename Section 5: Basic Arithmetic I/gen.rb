#!/usr/bin/ruby -w
require_relative(File.join(__dir__, 'create.rb'))

puts CodeEvaluator.write_to_files(
	%w(
		Intro_to_integer_and_float_class
		Intro_to_operators
		Intro_to_next_and_succ_methods
		Intro_to_odd?_and_even?_methods
		Intro_to_conversion_from_Float_to_String
		More_Float_methods
		The_nil?_method
		The_-_object_id_-_method
		The_-_is_a?_-_and_-_kind_of?_-_and_===_methods
		The_Spaceship_Operator
		Temperature_Converter
	),
	[
		"
			# PART 1
			# Numbers in Ruby are either Integer or Float objects
			a = 5
			p a.class
			p 5.class
			p 5.class.class

			a = 5.0
			p a.class
			p 5.0.class
			p 5.0.class.class

			# An Integer and Float object can also created
			# with thousand separator
			a = 5_000_000
			p a.class

			p 5_000_000.0_000_000
		",

		"
			# PART 2
			p a = 5
			p a + 5
			p a

			p a += 5
			p a

			p a *= 10
			p a %= 6
			p a /= 2
			p a -= 1

			# Float objects are simply numbers with fractional part:
			a = 5.0
			p a.class

			p 10 / 3
			p 10 / 3.0

			# Differenct operators have different precedence in Ruby
			a = 5 + 5 / 2 * 2 - 3 % 3

			# The cheat sheet is uploaded to GitHub!!
		",

		"
			# PART 3
			# The next and succ methods are avaiable on
			# Integer and String objects.
			# We'll see next_float method on Float objects soon

			# succ is actually a complementary method. It's just next!
			a = 5
			p a.succ
			p a.succ.succ.succ

			a = 5
			a += 1
			p a

			# Ok this is heavier than `a += 4`... But it's possible
			p a = a.next.succ.next.succ
		",

		"
			# PART 4
			# Remember the previous part? We worked with
			# the odd? and even? method. Integer#odd? returns
 			# false if the number is even and true if the number is odd.
			# You guessed it, Integer#even? does the opposite!

			p 5.odd?
			p 6.odd?
			p 6.even?
			p 5.even?
		",

		"
			# PART 5
			# Integer to Float and vice versa
			# The to_i converts an Integer / Float / String object to Integer
			# The to_f converts an Integer / Float / String object to a Float
			p 5.to_i
			p 6.to_f

			p 4.to_f
			p 4.0.to_i

			# Right, any object can be converted
			p '1hi'.to_i
			p '2hi'.to_f

			p '5_00hi'.to_i
			p '          5_0hi'.to_f

			p 'hi5'.to_i
			p 'hi5'.to_f
		",

		"
			# PART 6
			p 5.0
			p 5.1.round
			p 5.5.round

			p 5.5.truncate
			p 5.5.to_i
			p 5.5.floor

			p 5.5.ceil
			p 5.1.ceil

			p 5.5.next_float
			p 5.5.prev_float

			p 0.zero?
			p 1.zero?
			p 0.0.zero?
			p 0.000_1.zero?
		",

		"
			# PART 7
			# The nil? method is avaiable on every objects
			p 5.nil?
			a = nil
			p a.nil?
			p false.nil?
			p a.class
		",

		"
			# PART 8
			# The object_id returns the pointer to the
			# location in memory.
			# But for performance reasons the object_id of
			# true, false, Integers, Floats, nil, are fixed.

			'Hello'.object_id
			'Hello'.object_id

			1.object_id
			1.object_id

			[1, 2, 3].object_id
			[1, 2, 3].object_id

			nil.object_id
			nil.object_id

			# Here's a map loop that returns the object_id
			# of 11 numbers
			p (0..10).map { |x| x.object_id }
		",

		"
			# PART 9
			# The is_a and kind_of method works similarly
			# They return if an object belongs to a given class
			p 5.is_a?(Integer)
			p 5.is_a?(String)
			p 5.kind_of?(Array)

			# The case subsumption operator (===) can also be used:
			p Integer === 5

			# You can use the class method
			a = 5
			p a.class == Integer

			# Only available to Numeric
			p a.integer?
		",

		"
			# PART 10
			# The spaceship operator (<=>) returns -1, 0, or 1
			p 1 <=> 2
			p 1 <=> 1
			p 1.<=>(0)
			# When the object is smaller than the argument,
			# the <=> method returns -1, if they are equal, the
			# return value is 0, if the argument in bigger than the
			# object, it will return 1

			# That's it for now. Well will take a deeper look at it
			# when learning the Enumerable module.
		",
		"
			# PART 11
			# The formula is (T - 32) * (5 / 9) or (T - 32 * 0.555555)
			# 1
			print('Enter the Celsius: ')
			puts STDIN.gets.to_i.-(32).*(5 / 9.0).round(2)

			# 2
			print('Enter the Celsius: ')
			puts ((STDIN.gets.to_i - 32) * (5 / 9.0)).round(2)

			# 3
			print('Enter the Celsius: ')
			puts STDIN.gets.to_i.then { |i| \"\#{i}°C = \#{((i - 32) * (5 / 9.0)).round(2)}°F\" }
		"
	]
) if $PROGRAM_NAME == __FILE__
