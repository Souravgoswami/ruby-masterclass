#!/usr/bin/ruby -w
require_relative(File.join(__dir__, 'codeevaluator'))

puts CodeEvaluator.save_as(
	%w(
		Creating_Strings
		String_Interpolation
		Escape_Characters
		The_*_method
		Using_the_==_===_eql?_methods
		length_size_count_methods
		upcase_downcase_capitalize_swapcase
		reverse_method
		String_concatenation_+_+=_concat_<<_methods
		empty?_method
		extract_character(s)_with_[]_syntax
		Intro_to_mutable_strings
		clear_and_replace_methods
		slice_method
		Intro_to_bang_methods
		Intro_to_chomp_chop_strip_lstrip_rstrip_methods
		Intro_to_index_rindex_methods
		The_include?_method
		Intro_to_squeeze_squeeze!_methods
	),
	[
		"
			# PART 1
			# Strings can be created in many ways:
			a = \"Hello World\"
			b = 'Hello World'
			d = %Q(Hello World)
			c = %q(Hello World)
			e = \"Hello \"\"World\"
			f = %/Hello World/
			p a, b, c, d, e, f

			# Apart from this, there are various here docs which we
			# will take a look at Strings III

			# The %q and the () can be replaced
			# with any non-alphanumeric characters:
			%Q[hi]
			%+hello+
			%q&hola&
		",

		"
			# PART 2
			# The String#* method can multipy a string n number of times
			p '-' * 10
			p 'hello ' * 3
			p 'hi' + 'hello ' * 3 + 'hi'
			p 'hi' * (3 + 3)
		",

		"
			# PART 3
			# String interpolation allows us to insert a value, a
			# variable, or a constant inside a string:

			# You have to use the soft quotes(\"\"), %Q or % syntax
			# or it will not show the literal inside the \#{}
			p \"Hi\#{5}\"
			p %Q{Hi\#{5}}
			p %/Hi\#{5}/

			p 'Hi \#{5}'
			p %q{Hi\#{5}}

			# The to_s method is needed if you are running this in say, atom runner!
			print 'Enter your name please: '
			p \"Hello, \#{STDIN.gets.to_s.strip}\"
		",

		"
			# PART 4
			# Escape characters follows a backslash and then a code.
			# You have to use either \"\" or %Q or % syntax.
			# For example:
			puts \"A tab:\\t.Code: \\\\t\"
			puts \"A newline:\\n. Code: \\\\n\"
			puts \"A space:\\s. Code: \\\\s\"
			puts \"A backspace\\b. Code: \\\\b\"
			puts \"A carriage return\\r. Code: \\\\r\"
			puts \"\\e[1;34mA colour\\e[0m\\s. Code: \\\\e[1;34m\"
			puts \"This is a Unicode: \\u263a. Code: \\\\u263a\"
			puts \"This is hex code for another unicode: \\xF0\\x9F\\x98\\x81. Code \\\\xF0\\\\x9F\\\\x98\\\\x81\"
			puts \"This is a font \\xf0\\x9d\\x94\\x9e. Code: \\\\xf0\\\\x9d\\\\x94\\\\x9e\"
		",

		"
			# PART 5
			# The == method is available on any object
			# As we discussed earlier, it's equality operator, and
			# != does the opposite
			p 'foo' == 'foo'
			p 'foo'.==('foo'.next)
			p 'foo' == 'FOO'

			# The eql?() method is also avalilable on all the objects
			# Let's see it on an integer first!
			p 1 == 1
			p 1.eql?(1)

			p 1 == 1.0
			p 1.eql?(1.0)

			# Right in eql? the caller and the argument has to be same
			# class, and it has to be exactly the same! It's quite strict!
			# Now let's see it on String objects
			p 'foo'.eql?('foo')
			p 'foo'.eql?(1)
			p 'foo'.capitalize.eql?('Foo')

			# The case subsumption operator can be used to check if
			# The class is string or not:
			p String === 'hi'
			p Math === 'hi'
			p Integer === 'hi'
			p %q$hi$.class === String
			p Class === %q$hi$.class

			# Or it could work just like the String#== or String#eql? methods:
			p 'hi' === 'hi'
			p 'hi' === 'hi'.next
		",

		"
			# PART 6
			# The length, size, count methods
			# Returns the character length of a string object.
			p 'hello world'.size
			p 'hello world'.length
			p 'hello world'.bytesize

			p 'hello world'.count('l')
			p 'Hello world!! This is Ruby!'.count(' ')
		",

		"
			# PART 7
			# The upcase method converts lowercase characters in a string to uppercase
			# The downcase method converts uppercase characters in a string to lowercase
			# The capitalize method makes the first character of a string upcased, and all downcased

			p 'Hello, this is Ruby'.upcase
			p 'Hello, this is Ruby'.downcase
			p 'Hello, this is Ruby'.capitalize
			p 'hello.world'.upcase
			p 'HELLO.WORLD'.downcase
			p 'hello.world'.capitalize
			p '...'.capitalize
		",
		"
			# PART 8
			# The reverse method reverses a String and an Array.
			# For now, let's concentrate on reversing Strings.
			p 'Madam'.reverse
			p 'Ruby'.reverse.upcase
			p 'R'.reverse
			p 'AND'.reverse
			p 'Racecar'.downcase.reverse
			p 'risetovotesir'.reverse
		",

		"
			# PART 9
			# String can be concatenated in the following ways
			a = 'Hello '
			p a + 'World'
			p a

			a += 'World '
			p a

			p a << 'World '
			p a

			p  a.concat 'World'

			# Wyou add a string object with +, it just concatenates two strings
			# without modifying the original variable.
			# But if you want to change the variable a, you can
			# use +=, <<, or concat methods.

			# Using +=
			# `a += 'World '` actually means `a = a + 'World '`
			# You see your program has to get the value of a, add 'World' to it,
			# then write it to a new memory location! Which is ridiculous!
			# In that case if you are working with a billion character long string,
			# It will take huge time. Like a minute or so in my system.
			# It will also require more than 2 gigs of RAM.
			# But if you use either concat or <<, you will save time and memory as
			# demostrated in the class!
		",

		"
			# Part 10
			# The empty method can be used to check if a string is empty or not!
			# It might sound like stupid but we will see in block sections, how these
			# methods (first, last on arrays (instead of [0] or [-1],
			# empty? on strings (instead of str == '')
			# odd?, even? on Integer objects (instead of val % 2 == 0 or val % 2 != 0))
			# can make your codes shorter! Anyways,

			a = ''
			p a.empty?

			# Or:
			p a == ''
			p a.eql?(%!!)

			a = ' '
			p a.empty?

			# Here's a map preview:
			a = 'hello', 'world', 'this', '', '', 'Ruby'
			p a.count('')
			p a.count(&:empty?)
		",

		"
			# PART 11
			# A [n] after a string and array will return the n object
			# A [0] after a string or an array will return the first object
			# A [-1] after a string and array will return the last object
			# A [n..n] refers to a range after a string or array.

			a = 'Ruby is ostentatious!'

			p a[0]
			p a[1]
			p a[-2]
			p a[-6]
			p a[0..3]
			p a[-1]
			p a[0, 4]
		",

		"
			# PART 12
			# In Ruby, Strings are mutable objects!
			a = 'Perl is awesome'
			a[0..3] = 'Ruby'
			a[0..-1] = 'Hello World'
			p a

			a = 'Hello World'
			a[6..-1] = 'Ruby'
			p a
		",

		"
			# PART 13
			# The clear method clears a string without changing
			# the object id. It's a good practice not to change the
			# object id in case of strings, arrays, hashes, etc...
			a = 'hello'
			p a.object_id
			a.clear
			p a
			p a.object_id

			# Bad practice
			a = 'hello'
			p a.object_id
			a = ''
			p a
			p a.object_id

			# The replace method changes a string without
			# changing the obect id. You should use it when
			# you need to change a string

			name = 'Sally'
			p name.object_id
			name.replace('Jessie')
			p name
			p name.object_id

			# This is a bad practice
			name = 'Sally'
			p name.object_id
			name = 'Jessie'
			p name
			p name.object_id

			# You can replace the `replace` method with
			# `str.clear.concat` method chain! But that
			# involves some extra hooks. And it's better to
			# use `replace` straight away
			name = 'Jesscar'
			p name.object_id
			name.clear.concat('Sheida')
			p name
			p name.object_id
		",

		"
			# PART 14
			# The slice method works like bracket syntax
			# But it's a method on string
			a = 'I love the Ruby programming language'
			p a[0]
			p a.slice(0)

			p a[2..5]
			p a.slice(2..5)

			p a[7, 3]
			p a.slice(7, 3)

			# You got it! It's very convenient when
			# You

			a[/love/]
			a.slice(/love/)

			p a[/[aeiouAEIOU]/]
			p 'Ruby Rocks!'.slice(/[aeiouAEIOU](..)/)
		",

		"
			# PART 15
			# Did you notice bang methods on string objects?
			# They are methods with ! at the end...
			# Array and Hash objects also have bang methods on them!
			# Bang methods modify the original string without changing
			# the object id!

			a = 'Hello World'
			p a.object_id

			# Here neither a nor a's object id change
			p a.next
			p a
			p a.object_id

			# Here a changes, but the object id doesn't
			p a.next!
			p a
			p a.object_id

			# Take a look at another method!
			p a.downcase
			p a

			p a.downcase!
			p a

			p a.capitalize!
			p a

			p a.chop
			p a

			p a.chop!
			p a
		",

		"
			# PART 16
			# The chomp method, we used earlier, is used to strip off the extra newline
			# character at the end of a string:
			p \"a\\n\\n\\n\".chomp
			p \"Ruby!\".chomp

			# chop method chops out the last character:
			p \"a\\n\\n\\n\".chomp
			p \"Ruby!\".chop

			# The strip method removes trailing white space, new line,
			# tab, form feed, carriage return characters from both
			# right and left side of the string
			p \" \\n\\t\\fRuby!\\n\\t\\f\\r \".strip
			p \"Ruby!\".strip

			# The lstrip method only strips the trailing left whitespace:
			p \" \\n\\t\\fRuby!\\n\\t\\f\\r \".lstrip

			# The rstrip method only strips the trailing right whitespace
			p \" \\n\\t\\fRuby!\\n\\t\\f\\r \".rstrip

			# They all have bang methods!
			a =  \" \\n\\t\\fRuby!\\n\\t\\f\\r \"
			p a.lstrip!
			p a.rstrip!
			p a.strip!
			p a.chomp!
			p a.chop!
		",

		"
			# PART 17
			# The index method returns the index of a character from left:
			p 'Ruby is my favourite programming language!'.index('u')
			# Here it's 1 because it's after R, which is in index 0

			# The rindex counts from right
			p 'Ruby is my favourite programming language!'.rindex('u')
			# This counts the index of language's u, which is at 37
		",

		"
			# PART 18
			# The squeeze and squeeze! methods removes duplicates from
			# a string if they occur right next ot each other!
			a = 'Ruby or sapphire?!'

			p a.squeeze
			p a

			p a.squeeze!
			p a

			p 'Mooooonday!'.squeeze
		",

		"
			# PART 19
			# The include method can check if a stirng contains a substring
			p 'Hello'.include?('e')
			p 'This is Ruby'.include?('Ruby')

			a = 'Once upon a time, in a galaxy far far away'
			p a.include? 'Once'
			p a.include? 'once'
		"
	]
) if $PROGRAM_NAME == __FILE__
