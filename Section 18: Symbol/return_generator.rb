#!/usr/bin/ruby -w
require_relative(File.join(__dir__, 'code_evaluator'))
$dictionary_lookup = false

save_as(
	%w(
		Intro_to_symbol_objects
		Usage_of_symbols
		Converting_Symbol_objects_to_String_objects_and_vice_versa
		object_id_-_of_symbols
	),
	<<~'EOF'
		<begin 1>
			# Symbols behave like strings but they are lightweight as integers.
			# There are not many methods available on symbol.
			# You see the reduce takes two arguments, one is mandatory:
			(1..5).reduce(1, :*)
			# The :* is a symbol
			p :*.class

			p :hello
			puts :hi!

			# Symbols can be created in the following ways:
			p :Hello_World
			p :'Hello World'
			p %s(Hello World)
		</end>

		<begin 2>
			# Symbols are used in place of light weight strings
			# We can also declare constants with strings:
			Object.const_set(:Apple, 5)
			p Apple

			# For creating methods:
			define_method(:hello_world) { |str = 'Hello World'| str }
			p hello_world

			# For calling methods:
			p Object.send(:hello_world, 'Hi!!')
			p method(:hello_world).call('Ahoy!')
			p Object.instance_method(:hello_world).bind(Object).call('Hola')

			# For creating hashes, we will take a deeper look at the hash section:
			h = {apple: 5, pineapple: 8, mango: 1}
			p h

			# And there are other usage, most of which we will be seeing from now on!
		</end>

		<begin 3>
			# Yes, symbols can be converted to string
			a = :'Hello World'
			p a.to_s
			p a.id2name

			p a.upcase.to_s
			p a.succ.to_s
			p a.next.id2name

			# Converting a string to a symbol:
			a = 'Hello World'
			p a.to_sym
			p a.intern
		</end>

		<begin 4>
			# The object_id of symbol is unique like Integers and Floats
			# This makes them very light weight
			# The equal? method can be used to compare object_id as well!
			a = :Foo
			b = :Foo
			p a.object_id
			p b.object_id

			p a.object_id == b.object_id
			p a.equal?(b)

			# There's no way to modify a or b without changing the object_id!
			# In the benchmark section we will compare the performance
		</end>
	EOF
) if $PROGRAM_NAME == __FILE__
