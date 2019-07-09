#!/usr/bin/ruby -w
require_relative(File.join(__dir__, 'code_evaluator'))

puts save_as(
	%w(
		Intro_to_Arrays
		Creating_Array_with_Bracket_Syntax
		Creating_an_Array_with_Array.new
		Using_%w_%W_syntaxes
		The_size_length_count_methods
		Accessing_Array_items_with_bracket_syntax
		The_slice_method
		The_index_method
		Finding_array_elements_with_find_and_select_methods
		The_sort_method
		The_reverse_method
		The_push_append_concat_+=_and_<<_methods
		The_pop_delete_-_delete_at_-_methods
		The_shift_and_unshift_methods
		Accessing_Array_items_with_fetch_and_at_methods
		Overwrite_values_with_the_bracket_syntax
		The_first_and_last_methods
		Equality_and_inequality_operators
		The_<=>_operator
		sort_method_with_<=>
	),
	<<~'EOF'
		<begin 1>
			# Arrays are used for storing items sequentially.
			# They can include any objects.
			# Arrays are mutable object just like strings.
			# You can use the [] or slice methods on them!
			# The items are called elements, and the number
			# where the items are stored, are called indexes.
			# Like strings, they have concat, <<, +=, delete methods
			# Arrays also have push, pop, shift, unshift methods.
			# You can transpose an Array, rotate an array.
			# There are also bang methods that don't change the
			# memory location of an array!
			# Let's look at Part2 in order to dive into the coding!
		</end>

		<begin 2>
			# A literal Array can be created in many ways
			a = ['Hello', true, 0, false, nil, Class.new { define_singleton_method(:x) { 5 } } ]
			p a
			p a[0]
			p a[0..2]
			p a[1, 2]
			p a[1, 3]
			p a[-1].x

			# We can even omit the braces:
			a = ['Hello', true, 0, false, nil, Class.new { define_singleton_method(:x) { 5 } }]
			p a

			a = []
			a[5] = 'hello'
			p a
		</end>

		<begin 3>
			# The other way of creating an Array is:
			p Array.new(5)
			p Array.new(5, true)

			# note that the object id is same everywhere. It
			# just creates the same item from index 0 to -1!
			a = Array.new(3, [])
			p a[1].equal?(a[2])

			a = Array.new(5, rand(97..122).chr)
			p a[0]
			p a[0].class
			p a[0].replace('hi')
			p a

			p a[1].replace('x')
			p a

			# = changes the object id of string and arrays
			# garbage collector collects the discarded value
			# at the time the program exits (not at runtime).
			p a[1] = 'y'
			p a
			# In the above example, 'x' is handled by garbage collector.

			# Another way of creating Array without object_id being similar
			p Array.new(5, nil)
			a = Array.new(5) { |i| i.to_s }
			p a[0].equal?(a[1])

			# Blocks can be used as this
			# (you can neither use method chaining nor can pass arguments)
			p Array.new(5) { |i| i.next }
			p Array.new(5, &:next)

			# The itself method is available on all the Ruby objects.
			p Array.new(5, &:itself)

			# Or to create single item:
			Array('something')
			# You see Array is a method, it needs (), but Array.new is a class.
			Kernel.Array(5)
		</end>

		<begin 4>
			# The %w or %W syntaxes can be used to crate arrays containing
			# strings:
			a = %w(hello world#{5} this is a single quoted splitted string)
			p a[2..-1]

			# The above is quite similar to:
			p 'hello world#{5} this is a single quoted splitted string'.split

			# The next one is %W:
			p %W(hello world#{5} this is a double quoted splitted string)
			p "hello world#{5} this is a double quoted splitted string".split

			# This is a quick way to create arrays:
			puts %W(\xF0\x9F\x95\x9B \xF0\x9F\x95\x90 \xF0\x9F\x95\x91 \xF0\x9F\x95\x92 \xF0\x9F\x95\x93 \xF0\x9F\x95\x94)
		</end>

		<begin 5>
			# The size and length methods can be used to count the size of the Array:
			a = Array.new(5, &:itself)
			p a.size
			p a.length

			# The count method (like strings) can accept a block, and count the true
			# values in the block. Without a block, it behaves like size / length method.
			p a.count { |i| i.odd? }
			p a.count(&:odd?)
			p a.count { true }
			p a.count { false }
			p a.count

			# Count can also accept arguments:
			a = [true, false, true, false, 2, 1, 0]
			p a.count(true)
			p a.count { |i| not(i) }
		</end>

		<begin 6>
			# This section covers accessing Array elements with [] syntax.
			a = Array.new(10, &:next)

			# getting items
			p a[0]
			p a[2..3]
			p a[2, 3]
			p a[-1]

			# mutating arrays
			p a[0] = 5
			p a
			p a[-1] = 0
			p a

			p a[0, 5] = %w(a b c d e)
			p a

			p a[0, 4] = 'a'
			p a
		</end>

		<begin 7>
			# The slice method is alternative to [] method on arrays
			# This is very much like the slice method on string...
			a = Array.new(10, &:next)
			p a[0]
			p a.slice(0)

			p a[0..1]
			p a.slice(0..1)

			p a[2, 3]
			p a.slice(2, 3)

			p a[-1]
			p a.slice(-1)
		</end>

		<begin 8>
			# The index method searches for an item and returns
			# The index of the item

			a = Array.new(15) { |i| Math.sin(i).round }
			p a.index(0)
			p a.index(1)
			p a.index(-1)
			p a.index(true)

			p a.index { |i| i == -1 }

			a = ('a'..'z').to_a
			p a.index('e')
			p a.index { |e| e.eql?('h') }
			p a.index(100)

			#############################

			# The rindex searches from right:
			a = Array.new(15) { |i| Math.sin(i).round }
			p a.rindex(0)
			p a.rindex(1)
			p a.rindex(-1)

			p a.rindex { |i| i == -1 }

			a = ('a'..'z').to_a
			p a.rindex('e')
			p a.rindex { |e| e.eql?('h') }
		</end>

		<begin 9>
			# The find method finds for an array element
			# when an element is found
			# the loop is broken, and the element is returned
			# nil is returned if the element is not present
			a = [0, 100, 200, 500, 300, 800, 400, 700, 900, 500, 500]
			p a.find { |x| x == 500 }
			p a.find { |x| x == 550 }

			# The select method searches for the item
			# throughout the whole array:
			p a.select { |x| x == 500 }
			p a.select { |x| x == 550 }
		</end>

		<begin 10>
			# The sort method is a quick way to sort an array:
			a = [1,5,3,2,0,1]
			p a.sort

			a.replace %w(a e i o u b d c h f g)
			p a.sort

			a = [1,2,3, 'a', 'c', 'b', 6]
			# ArgumentError is raised if you are sorting an array
			# with various objects
			# a.sort    # Line 14: comparison of String with 6 failed
		</end>

		<begin 11>
			# The reverse method reverses an array!
			a = %W\hello #{5} World\ + [false, true, nil, String]
			p a.reverse
			p a
			p a.object_id

			p a.reverse!
			p a
			p a.object_id
		</end>

		<begin 12>
			# The push, append, concat, +=, << method can be
			# used to add an element or an array of elements
 			# to another array
			# The += method changes the memory location of the
			# original array (thus changes the object_id) and it should
			# be avoided in any cases... But we will look at it.
			# We will compare efficient practices in section 40

			a = (1..5).to_a
			a.push(100)
			p a

			a.push(5, 6, 7)
			p a

			# Append can be used to push *args into an Array
			# it returns the Array itself (just like the push), so
			# several methods can be chained together
			a = Array(1..5)
			a.append(%w(x y z))
			p a
			a.append(5).append(6, 7)
			p a

			a = Array.new(5, &:itself)
			a.concat(%w(a b c d e))

			# push and append pushes one single element
			# while concat concatenates an array
			a, b = Array.new(5, &:next), %w(w x y z)
			p a.object_id
			a.concat(b)
			p a
			a.push(%w(a b c d))
			p a
			# You can't do:
			# a.concat(5)
			# You can:
			a.concat([5])
			p a.object_id    # The object id doesn't change at all

			# The += method can be used as replacement for concat,
			# but again, it reassigns the whole array to new memory
			# location. This is inefficient, and should be avoided but
			# the += method exists.
			a, b = Array.new(5), %w(nice hair)
			p a.object_id
			a += b
			p a

			# The << method is a complementary method of push.
			# It also returns the self array, so it's possible to chain
			# multiple method together or even << 'element' << 'element'
			# E.g.:
			a = 5, 6, 7
			p a.object_id
			a << 1
			a.<<(2)
			p a << 3
			# a << 100 returns self, then << on that returns self
			a << 100 << 200 << 300
			p a
			p a.object_id
		</end>

		<begin 13>
			# Now if you want to delete array elements
			# You can use pop, delete, delete_at methods.
			# The pop method deletes the last item from the array, and
			# returns the last value:
			a = Array(1..10)
			p a.pop
			p a
			p a.pop.class

			# delete method deletes an item recursively:
			a.replace([1,2,3,4,5,6, 5, 6, 4, 1])
			a.delete(6)
			p a
			# it returns nil if the argument is not in the array
			p a.delete('a')

			a.concat(('a'..'d').to_a)
			p a.delete('a')
			p a

			# The delete_at method deletes an element at a given index
			p a.delete_at(1)
			p a
		</end>

		<begin 14>
			# The shift method delete an element from the beginning of an array:
			a = %w( java python perl ruby crystal)
			p a
			a.shift
			p a
			2.times { a.shift }
			p a

			# The unshift method appends an item to the beginning of the array:
			compiled_languages = %w(c# rust go crystal javascript)
			p compiled_languages.unshift('c', 'c++').pop
			p compiled_languages
		</end>

		<begin 15>
			# We have seen that we can use [] or slice methods to access array
			# elements. We can use the fetch and at methods too!
			a = %w(a b c a b c)
			p a.fetch(2)     # returns the item at index 2
			p a.fetch(3) { |x| puts x }
			# It raises an error if the index is out of bounds:
			# p a.fetch(2000)    # IndexError
			# But if you provide block, it won't raise the error,
			# but it will yield the index to the block
			p a.fetch(200) { |x| puts "#{x} is out of bounds" }

			# To avoid this, you can also use the at method:
			p a.at(2)
			# at returns nil if the index is out of bound!
			p a.at(1000)

			# Sometimes you need to have errors, in that case you can
			# catch it gently. Or you can use blocks.
			# Say the index 4 has nil:
			a = [1, 2, 3, 4, nil, 6]
			p a.at(4)
			p a.at(80)
			p a.fetch(4)
			p a.fetch(80) { |x| puts "Uh oh #{x} is out of bounds!" }
			# In such case fetch could come handy to inform our user!
 			# That said, both fetch and at could come handy
			# while you program...
		</end>

		<begin 16>
			# Bracket syntax can also overwrite values just like the
			# bracket syntax on strings:
			a = 1, 2, 3, 4
			p a.object_id
			a[1, 1] = 'a'
			p a
			p a[1, 2] = 'z'
			p a
			p a[4, 0] = 'y'
			p a
			p a[1, 0] = 'l'
			p a
			p a.object_id

			# Surely garbage collector collects the old value but after the
			# program exits!
		</end>

		<begin 17>
			# The first method returns the first(n) objects
			a = Array.new(10, &:next)
			p a.first
			p a.first(3)

			p a.last
			p a.last(3)

			a = Array.new(10) { |i| [i, i + 1, i + 2] }
			# bracket syntax could come in handy in such situation:
			p a.map(&:last)

			# or just in
			p a.last(3)
		</end>

		<begin 18>
			# The equality operator == can be used to check if an array
			# is equal to another array or not:
			p [1,2,3] == [1,2,3]
			p [1,2] == [0]

			# The inequality operator != does the opposite, it returns the
			# result opposite to the == operator
			p [1,2,3] != [1,2,3]
			p [1,2] != [0]
		</end>

		<begin 19>
			# Consider two arrays, a and b.
			# The spaceship operator returns:
			# 1 if array a is bigger than array b.
			# 0 if array a and array b are equal.
			# -1 if array a is smaller than array b.

			p [1,1] <=> [1]
			p [2] <=> [1,2]
			p [1] <=> [1]
			p [1, 2] <=> [1, 2]
			p [1] <=> [2]
			p [1, 2] <=> [1, 3]

			# The <=> method returns nil if the
			# items can't be compared
			a, b = Array(1..3), Array('a'..'d')
			p a <=> b
		</end>

		<begin 20>
			# The sort method on array with <=> can
			# produce various results:
			a = [1, 5, 3, 2, 4]
			p a.sort
			p a.sort { |x, y| x <=> y }
			p a.sort { |x, y| y <=> x }
		</end>
	EOF
) if $PROGRAM_NAME == __FILE__
