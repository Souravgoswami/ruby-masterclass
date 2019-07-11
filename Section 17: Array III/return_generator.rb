#!/usr/bin/ruby -w
require_relative(File.join(__dir__, 'code_evaluator'))
$dictionary_lookup = false

save_as(
	%w(
		The_take_method
		The_freeze_method
		Nested_arrays_and_transpose_method
		Array_union_intersection_and_difference
		Quiz_Creating_custom_transpose_method
		Unpacking_one_and_multi-dimensional_arrays
		The_partition_method
		The_-_group_by_-_method
		Challenge_Creating_Fibonacci_Sequence_in_one_line
	),
	<<~'EOF'
		<begin 1>
			# The take method picks up one or more elements from
			# an array, and returns another array.
			a = %w(apple banana grapes pineapple blueberry)

			p a.take(2)
			p a.take(1)
			p a.take(0)
			p a.take(100)
			# p a.take(-1)    # ArgumentError

			# In contrast to drop, which drops the first n elements and
			# returns the rest ones
			p a.drop(2)
			p a.take(2)
		</end>

		<begin 2>
			# The freeze method is available on all the objects!
			# For example:
			a = 'Str'.freeze
			# a.concat('hello')    # => FrozenError

			a = ['Raspberry Pi', 'Orange Pi', 'Banana Pi']
			a.freeze
			# a.push('Custard Pie')    # can't modify frozen Array (FrozenError)

			# That said you can't modify frozen objects!
			# Yes you ca reassign them!
			p a.frozen?
			p a.object_id

			p a = a + ['Custard Pie']

			p a.frozen?
			p a.object_id
		</end>

		<begin 3>
			# We have already seen nested arrays previously ;)
			# They are arrays inside arrays!
			a = []
			# Sour fruits
			a.push(%w(orange lime lemon grapes))

			# Sweet fruits
			a.push(%w(banana mangos watermelon peach))

			# Now let's capitalize all the items:
			a.map! { |x| x.map(&:capitalize) }

			# Speaking of transpose, it's all about matrices!
			# a b c
			# d e f
			# g h i
			# j k l

			# The transpose will create:
			# a d g j
			# b e h k
			# c f i l

			ary = 1.step(10, 3).map { |i| 96.then { |j| (0..2).map.with_index { |x, ind| j + ind + i}.map(&:chr) } }
			p ary.transpose

			# Let's use the fruit array!
			# Let's combine one sweet with one sour ;)
			p a
			print a.transpose
		</end>

		<begin 4>
			# Array Union and Intersection...
			# There are sets in Ruby, which are just like hashes.
			# But you can also think of arrays as sets? Probably...
			# You can union an array using the | operator.
			# Yes, remember it's not `or` or || as in short circuit evaluator...
			# It's array union:
			# Imagine combining 2 arrays with the duplicates removed:
			a, b = [1, 2, 3, 4, 5, 4], [0, 5, 6, 7, 8, 9, 9]

			p a.concat(b).uniq
			# Well, the above kind of works! But it's very heavy to the processor
			# Let's unify the arrays!
			p a, b

			p a.dup.concat(b).uniq
			p a.union(b)
			p a.|(b)

			oo_languages = %w(ruby crystal smalltalk perl c++ rust python java)
			functional_languages = %w(c c++ rust javascript rust java)
			p oo_languages.dup.concat(functional_languages) | []
			p oo_languages.union(functional_languages)
			p oo_languages | functional_languages

			[1,2,3].union([2,3,4]).union([5, 6, 7, 9, 8, 2, 3, 4]).sort

			# Intersection only takes the common elements from 2 arrays
			p [a, b]
			p a.&(b)
			p a & b

			p [1, 2, 3] & [2, 4, 5]

			# Which is another heavy weight way of achiveing the same task:
			p [1, 2, 3].select { |x| [2, 4, 5].include?(x) }

			berries = %w(blueberry blackberry raspberry cranberry strawberry)
			fruits = %w(mango lime lemon cranberry tamarind blueberry jackfruit)
			p berries & fruits
			p berries.select { |x| fruits.include?(x) }
			p berries.+(fruits).then { |a| a.group_by { |x| a.count(x) } }.max[1].uniq

			# So + concatenates an array with the another arrays passed
			# as an argument. * multiplies an array n times:
			p [1,2,3] * 3
			p [1,2,3].cycle(3).to_a

			# We are left with / and -. Unfortunately there's no / method :(
			# But - can be used for differences:

			visit_list = ['Rome', 'Paris', 'Goa', 'France', 'Switzerland', 'Maldives', 'London']
			visited = ['Paris', 'Goa', 'London']

			p yet_to_visit = visit_list - visited

			shop_list = %w(Soap Rice Noodles Chillies Potatoes Milk Desserts Candies)
			shopped = %w(Chillies Potatoes Noodles Milk Candies)
			yet_to_shop = shop_list - shopped
			p yet_to_shop
		</end>

		<begin 5>
			# Our own transpose method!
			define_method(:transpose) { |ary| ary[0].size.times.map { |x| ary.size.times.map { |y| ary[y][x] } } }

			ary = 0.step(12, 3).map { |i| 3.times.map { |j| (i + j + 97).chr } }
			p ary.transpose
			p transpose(ary)

			ary = [[1, 2, 3, 4, 5], [false, [], true, (1..Float::INFINITY), FloatDomainError]]
			p ary.transpose
			p transpose(ary)
		</end>

		<begin 6>
			# Unpacking one and multi-dimentional arrays
			ary = %w(once upon a time in a galaxy far far away)
			a, b, c, d, e, f, g = ary
			p a
			p b
			p c
			p d
			p e
			p f
			p g

			# elements "far", "far", and "away" are never assigned in such case
			ary = %w(hello beautiful world)
			a, b = ary
			p a
			p b

			# You can use this syntax if you don't want the rest items:
			ary = %w(ruby crystal perl)
			a, b, * = ary
			p a
			p b

			aa, * = ary.rotate
			p aa

			# We can splat (*) unpack an array.
			# Here we are going to assign the first elements to a
			# the last one to b
			*a, b = [1,2,3]
			p a
			p b

			*a, b = ary
			p a
			p b

			a, *b = ary
			p a
			p b

			# Unpacking multi-dimentional arrays:
			ary = 0.step(10, 3).map { |x| 3.times.map { |y| 97.+(x + y).chr } }
			a, b = ary
			p a
			p b

			a, *b = *ary
			p a
			p b

			# An array can be created like this:
			*a = 'Hello world'
			p a

			# Or:
			a = *'Hello World'

			# While creating non integer array without [] the assigned objects
			# doesn't become an array
			p a = 'a', 'b', 'c', nil, false
			p a

			# You can use the following syntax to overcome the problem
			a = * 'a', 'b', 'c', '5', nil, false
			p a
		</end>

		<begin 7>
			# The partition method:
			ary = Array(1..20)
			odd, even = ary.partition { |x| x.odd? }
			p odd
			p even

			# Similarly
			p ary.partition(&:odd?)

			# let's sort the array with words that has a
			ary = %w\once upon a time in a galaxy far far away\
			p ary.partition { |x| x.include?('a') }
		</end>

		<begin 8>
			# The group_by method is similar to partition method
			# except it returns a hash:
			a = (1..20).to_a
			hash = a.group_by { |x| x.odd? }
			odd, even = hash[true], hash[false]
			p odd
			p even

			odd, even = a.group_by(&:odd?).then { |x| [x[true], x[false]] }
			p odd
			p even

			ary = 10, 20, 770, 49, 550, 13, 200, 40, 36
			p ary.group_by { |x| x.gcd(40) }
		</end>

		<begin 9>
			# Fibonacci for one liners!

			# 1.
			10.times.reduce([0, 1]) { |ary| ary.push(ary.last(2).sum) }

			# 2.
			10.times.each_with_object([0, 1]) { |_, ary| ary.push(ary.last(2).sum) }

			# 3.
			[0, 1].tap { |x| 10.times { x.push(x[-1] + x[-2]) } }

			# 4.
			->(a = 1, b = 0) { 12.times.map { (a, b = b, a + b)[0] } }.call
		</end>
	EOF
) if $PROGRAM_NAME == __FILE__
