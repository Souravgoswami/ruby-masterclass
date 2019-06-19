#!/usr/bin/ruby -w
require_relative(File.join(__dir__, 'create.rb'))

CodeEvaluator.eval(
	%w(Intro_to_numbers Intro_to_assignment_operators Intro_to_global_and_local_variables
		Intro_to_constants  Intro_to_object_methods_and_method_chaining
		Intro_to_single_line_comments_and_multi-line_comments
		Intro_to_String_objects Intro_to_gets_method Intro_to_tap_method_on_objects Intro_to_then_method_on_objects
	),
	[
	'
		p 5
		p 6.0
		p 5.class
		p 6.0.class
	',

	'
		a = 5
		b = 6.0
		p b

		c = 5
		# The conditional assignment
		# Will only assign value to a variable if the variable
		# has either false or nil value or not defined before.
		c ||= 100

		p c = false
		c ||= true
		p c
	',

	'
		# Local variables can be defined simply, like this:
		a, b = 5, 6

		# The scope of local variables spans across the block
		# Local variables if defined inside a block, cannot be used outside the block
		1.times { inside_scope_variable = 5 }
		p defined?(inside_scope_variable)

		# Local variable if defined outside a block, and used inside the block later,
		# will act as a global variable inside block, so changing the value there
		# will also change the value outside:
		outside_scope_variable = 6
		1.times { outside_scope_variable = 2000 }
		p outside_scope_variable

		# Global Variables start with $ sign
		$a, $b = 100, 200

		p local_variables.sort
		p local_variables.include?(:a)

		p global_variables.sort
	',
	'
		# Unlike variables, constants should not change.
		A = 5
		# Their value can be changed, but it will warn you.
		# It is a bad practice.
		A = 5

		# You can use conditional assignment operators
		# But if A is nil, it will warn you again!
		A ||= 7
	',

	'
		# Everything in Ruby is an object.
		# String, Float, Integer, Complex, Array, Hash
		# And everything you can use of is an object!
		# Remember we wrote p 5.class in the beginning?
		# Well, 5 is integer and class a method available on any Integer.
		# So, object methods are methods that are available on an object.
		a = 5
		p a.class

		# Let us see all the available methods!
		p a.methods.sort

		# Let us use one!!
		p a.odd?
		p 5.odd?
		p 6.odd?
		p 6.even?

		# Look at the list, Integer responds to + method!
		# Well, +, -, *, %, / are not really operators then! Are they?
		# Everything in Ruby is a object, and every call is a method call.
		# Except some keywords like def, next, if, in, for, retry, redo, begin etc.
		p 5
		p 5 + 5
		# Ok so the above is called syntactical sugar or syntactic shorthand!

		p 5.+(5)
		# And the above one is the expanded syntax!

		p 5 * 5
		p 5.*(5)

		# In Ruby, you can omit braces while calling a method
		# That is why we are doing with the Kernel.p method!
		p 5.* 5

		# Itself returns the current object
		# just let us check if we can method chain or not!
		p 5./ 2.0.itself
		p 5./ 2.0.* 10
		p 5./(2.0).*(10)
		p (5./ 2.0).* 10
		# So we should not omit braces while method chaining!
	',

	'
		# Well we have been using single line comments, but here is
		# a deeper look!

		# Comments convey important messages, warnings, and bugs
		# It can also help you understand codes easily. But do not use
		# too much comments on a code. That makes code look bad.

		# So there are two ways of commenting...
		# Single Line Comments:
		# Hello this is a single line comment!!

		# Multiline comments
		# It is a # TODO...
		# The current generator file cannot accept =begin =end block
	',

	"
		# Just like Integers, String objects have numerous methods too!
		# Let us take a basic look for now, we will cover this in more detail
		a = 'Hello'
		p a.class

		p a.methods.sort
		p 'Hello' + 'World'
		p 'Hello ''World'

		# Ok avoid this one, not a python fan :(
		p '''Hiee!!'''

		# Double quote support string interpolation:
		p a = 5
		p a

		p \"Hello \#{a}\"

		# Single quote shows literals...
		p 'Hello \#{5}'

		# Escaping characters:
		p \"H\\\\el\\\\lo\"
		p \"Hi\#{5}\"

		# That's it for now! In part 27 we will take a deeper look at string objects,
		# varioius here documents, the %q, %Q syntaxes, and many more methods.),
	",

	'
		# The gets method can be used to get values from a string.
		p gets

		# This above gets is from module Kernel
		p method(:gets).owner
		p Kernel.gets

		# STDIN.gets and $stdin.gets are similar.
		# I think you all should use either STDIN.gets or $stdin.gets ;)
		p STDIN.gets
		p $stdin.gets
	',

	"
		# The tap method yields an object to a block,
		# and returns the self object. It's available on every object.
		# It can eliminate the practice of assigning variables everytime!
		c = 500.tap { |x| p x }
		p c

		a = 5.tap { |x| @val = x * x }
		p a
		p @val

		a = 'Hell'.tap { |y| y.concat('o') }
		p a
	",

	"
		# The then method modifies the actual value.
		# It's available on every object.
		a = 5.then { |x| x + x }
		p a

		a = 100.then { 'hello' }
		p a

		# Both the tap and then method will be fruitful
		# Throughout the sections. It might not make sense
		# now because we are just in the very basics.
		# We will see how it can reduce many SLOC!
	"
	]
) if $PROGRAM_NAME == __FILE__
