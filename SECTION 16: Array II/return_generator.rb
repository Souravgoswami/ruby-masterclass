#!/usr/bin/ruby -w
require_relative(File.join(__dir__, 'code_evaluator'))
# $dictionary_lookup = false

save_as(
	%w(
		The_uniq_and_uniq!_methods
		The_each_and_for_loops
		The_sum_method
		The_map_and_collect_loops
		The_inject_reduce_methods
		The_clone_and_dup_methods
		The_flatten_method
		The_clear_method
		The_permutation_and_combination_methods
		The_select!_reject_reject!_drop_-_drop_while_-_methods
		The_find_any?_all?_methods
		Quiz_Custom_-_select_index_-_method
		The_shuffle_shuffle!_methods
		The_sample_method
		The_rotate_rotate!_methods
		The_empty?_method
		The_cycle_method
		The_each_with_object_method
		The_compact_and_compact!_methods
	),
	<<~'EOF'
		<begin 1>
			# The uniq method removes all the duplicate
			# objects from an Array!
			ARY = [1, 2, 3, 5, 5, 90, 1, 200, 345]
			p ARY
			p ARY.uniq
			p ARY

			p ARY.uniq!
			p ARY

			# Now that we have all duplicates removed, let's
			# see what is returned by uniq and uniq!
			p ARY.uniq
			p ARY.uniq!

			# Right uniq! returns nil if there's no duplicates
			ARY << 5
			# or it returns the original array!
			# That's a caveat while using method chaining
			# bang methods.
			# You should do some research before you method
			# chain a method after a bang method!
			p ARY.uniq!
			p ARY.uniq!
		</end>

		<begin 2>
			# The each and for loops
			a = ('a'..'i').to_a

			# The each loop iterates over all the array item
			# and returns the array itself:
			a.each { |x| puts x + 'i' }
			p a.each { |x| puts x + x * 3 }.then { |x| x.equal?(a) }

			# Now we can replace the times loop in our previous section:
			b = %w(once upon a time in a galaxy far far away!)
			b.each { |x| puts x.capitalize }

			# The for loop is a bit different:
			gems = %w(ruby emerald diamond sapphire)
			for gem in gems do puts gem.capitalize end
		</end>

		<begin 3>
			# The sum method is a simple method
			# It adds up all the array elements together
			a = Array.new(10, &:next)
			p a.sum

			p Array.new(1_000_000, &:next).sum
		</end>

		<begin 4>
			a = Array.new(10, &:next)
			p a.map { |x| puts x }
			p a.map { |x| x.next }
			p a.map(&:next)

			p a.map { |x| "File_#{x}.rb"}
			#.each { |f| File.write(File.join(__dir__, f), '#!/usr/bin/ruby -w') }

			# We will dive deeper into these stuff a bit later!

			# The collect method is same as map:
			a.collect { |x| x.to_s }
			a.collect(&:next)

			# There's a bang method that replaces the original array:
			p [a, a.object_id]
			a.map!(&:to_s)
			p [a, a.object_id]

			a.collect!(&:to_i)
			p [a, a.object_id]
		</end>

		<begin 5>
			# The inject method combines all the elements
			# with a binary operator
			arr = Array.new(6, &:next)
			p arr.inject(:*)
			# Which means 1 * 2 * 3 * 4 * 5 * 6 or 6!
			# Other examples
			p arr.inject(:+)
			p arr.inject(:-)

			arr2 = Array.new(6) { |i| 97.+(i).chr }
			# It also take an additional argument:
			p arr2.inject('z', :concat)

			p arr2
			p arr2.inject(:+)
			p arr2

			# But concat will change the elements:
			arr2.inject(:concat)
			p arr2
			# Which means "a".concat("b").concat("c").concat("d").concat("e").concat("f")
			# "a".concat("b") changes "a" to "ab"!

			puts '-' * 10
			# The reduce method is exactly the same...
			# Use either inject or reduce throughout your program... Or both!
			p arr.reduce(:*)
			p arr2.reduce(:concat)

			puts '-' * 10
			# reduce also takes another argument:
			p arr
			p arr.reduce([]) { |arr, el| arr.push(el ** 2 + 10 * el) }
		</end>

		<begin 6>
			# The clone and dup method duplicates an array
			# dup doesn't preserve frozen state of an array
			# dup doesn't creates duplicates of the singleton methods
			# We will see the difference later!

			a = [1,2,3,4,5]
			p a

			x = a
			x.push(100_000, 200_000, 300_000)
			p a
			p x

			# So we see modifying x modifies a as well
			# let's delete some items of c
			a.pop(3)

			b = a.dup
			c = a.clone

			p a.object_id
			p b.object_id
			p c.object_id

			b.push(1000)
			c.push(1500)

			p a
			p b
			p c

			# Now consider strings:
			foo = 'Tom'
			bar = foo
			bar.concat(' + Jerry')
			p bar
			p foo

			# Ok let's dup the foo:
			foo = 'Tom'
			bar = foo.dup
			bar.concat(' + Jerry')
			p bar
			p foo

			# now let's do it with clone:
			foo = 'Tom'
			bar = foo.clone
			bar.concat(' + Jerry')
			p bar
			p foo

			# foo = 'Tom'.freeze
			# bar = foo.clone
			# bar.concat(' + Jerry')    # FrozenError
			# p bar
			# p foo
		</end>

		<begin 7>
			# The flatten method coalesces all the
			# nested arrays into one array
			a = [1, 2, 3, 4, [2, 3, 5], [100, 200, 300]]
			p a.flatten
			p a

			# There's also the flatten! method:
			a.flatten!
			p a
		</end>

		<begin 8>
			# The clear method is just used to clear all
			# the items of the array without modifying the
			# memory location
			a = Array.new(20, &:next)
			p a
			a.clear
			p a
			a.concat(%w(hello world))
			p a

			# We can use the replace method as well:
			p a
			a.replace([1,2,3,4,5])
			p a
		</end>

		<begin 9>
			#    The permutation method permutates an array
			# It returns an enumerator.
			# We can chain the to_a method to convert all the
			# possible arrangements into an array:
			a = [1, 2, 3]

			p a.permutation.class
			print a.permutation.methods.sort
			p a.permutation
			p a.permutation.to_a

			# the permutation method also accept a argument
			p a.permutation(2).to_a
			p a.permutation.to_a.map { |x| x.first(2) }

			p a.permutation { |x| puts x }
			p a.permutation.take(2)
			p a.permutation.take(100)

			# The combination method returns the combination
			# that can be formed with the array element.
			# It takes one mandatory parameter:
			p a.combination(2).to_a
			p a.combination(3).to_a
			p a.combination(1).to_a
		</end>

		<begin 10>
			# The select! method also modifies the original array
			# without modifying the object_id:
			fruits = ['Green Apple', 'Strawberry', 'Banana', 'Blueberry', 'Raspberry', 'Cranberry', 'Pineapple', 'Blackberry']

			# Select doesn't modify the array. What if we need to work only with berries?
			fruits.select { |x| x.end_with?('berry') }
			p fruits

			fruits.select! { |x| x.end_with?('berry') }
			p fruits

			# The reject method will reject items:
			fruits = ['Green Apple', 'Strawberry', 'Banana', 'Blueberry', 'Raspberry', 'Cranberry', 'Pineapple', 'Blackberry']
			p fruits.reject { |x| x.end_with?('berry') }

			# Like the select! method, the reject! method also modifies the original array
			# without modifying the object_id
			fruits.reject! { |x| x.end_with?('berry') }
			p fruits

			# The drop method deletes n items from the beginning and return self:
			fruits.concat(%w(guava watermelon lime cherry peach).map(&:capitalize))
			p fruits.drop(2)    # two items have been shifted
			p fruits

			# The difference with shift is that drop doesn't modify the original array
			# and drop returns the array itself while shift returns the items that have been dropped
			p fruits.shift(2)

			# drop_while method drops the item when the condition in block evaluates to true:
			p fruits
			p fruits.drop_while { |x| puts x }
		</end>

		<begin 11>
			# The find method, as we saw previously, looks up for an element in an array
			# passed as block.
			# It returns nil if the item is not found.
			# It returns an enumerator if no block is passed

			a = %w(A ginger cat and a white bottle)
			p a.find { |x| x == 'ginger' }
			p a.find { |x| x == 'calico' }
			p a.find { |x| x == 'calico' || x == 'ginger' }

			# Not that's cool! How about the any? method?
			# It goes through the array and yields each item.
			# If the item is found, it returns true
			# ary.any? is like asking: is there one item that matches the block:
			p a.any? { |x| x == 'ginger' }

			# Or:
			p [].empty?
			p [].any?

			p a.any?('ginger')
			p a.any?('calico')
			# or with Regexp
			a.any?(/calico|ginger/)

			numbers = Array(0..25).select(&:odd?)
			p numbers.any?(&:odd?)
			p numbers.any?(&:even?)
			p numbers.any?(1)
			p numbers.any?(2)

			numbers << 2
			p numbers.any?(&:odd?)
			p numbers.any?(&:even?)
			p numbers.any?(Integer)
			p numbers.any?(String)

			# The all? method returns true if all the elements
			# evaluates to true when the certain condition is applied:
			p a
			p a.all?(String)
			p a.all? { |x| String === x }
			p numbers.tap(&:pop)
			p numbers.all? { |x| x.odd? }
			p numbers.all?(&:odd?)
			p numbers.push(200)
			p numbers.all?(&:odd?)
			p numbers.all?(&:even?)
			p numbers.tap(&:pop)
			p numbers.push('20')
			# p numbers.all?(&:odd?)    # Error here!!

			# Enumerable#select, find, any?, all? can be very handy
			# when working with arrays.
		</end>

		<begin 12>
			# Creating our custom find_all_index method:
			define_method(:find_all_index) { |ary, ele| ary.map.with_index { |e, i| [i, e] if ele === e }.compact.then { |x| x.empty? ? nil : x } }

			a = %w(one green apple everyday keeps the doctor away!!)
			b = %w(Once upon a time in a galaxy far far away!)
			p find_all_index(a, 'one')
			p find_all_index(b, 'far')
			p find_all_index(a, 'doctors')
		</end>

		<begin 13>
			# The shuffle method rearranges all the items of the array.
			# Say you have a deck of cards. You shuffle them randomly.
			# Note that there's always one possibility of not getting the
			# deck shuffled at all!
			# That said, [1, 2].shuffle can return either [2, 1] or [1, 2] itself!
			[1, 2].shuffle

			a = Array.new(10, &:next)
			p a
			p a.shuffle

			# The bang method does the same job, except it modifies the
			# original array without modifying the object_id
			p a.shuffle!
			p a
		</end>

		<begin 14>
			# The sample method select random element(s) from an array!
			a = %w(there are water drops in the air)

			p a.sample
			# Which is equivalent to
			p a[rand(0...a.size)]

			p a.sample(2)
			p a.sample(4).join(' ')

			p [1, 2, 3].sample

			a = [1, 2, 3]
			p a.sample

			p srand
			p a[srand % 3]

			# You should use sample method, because it's very light weight
			# It's very secure for cryptography as well.
			# If you are doing very sensitive work, you may read /dev/urandom
			# directly to make sure you are doing the correct job!
		</end>

		<begin 15>
			# The rotate method rotates an array:
			a = (1..10).to_a
			p a.rotate
			p a.rotate.rotate
			p a.rotate(2)

			p a.rotate(-1)
			p a.rotate(-2)

			# There's also the rotate! method
			p a
			p a.rotate!
			p a
		</end>

		<begin 16>
			# The empty? method check if the array is empty or not:
			a = []
			p a.empty?
			a << 'hello there!'
			p a.empty?

			a.clear
			a << 'hello world' if a.empty?
			p a
		</end>

		<begin 17>
			# The cycle method:
			a = [1,2,3]
			a.cycle(2) { |x| puts x }
			a = ['a', 'b']
			a.cycle(2) { |x| x.concat(x) }
			p a
		</end>

		<begin 18>
			# The each_with_object method is like reduce(obj) or inject(obj)
			ary = [1,2,3]
			ary.reduce('') { |str, el| str.concat(el.next.to_s) }
			ary.each_with_object('') { |el, str| str.concat(el.next.to_s) }

			[36, 50, 602].each_with_object([]) { |el, ar| ar.push(el.gcd(10)) }
			[36, 50, 602].inject([]) { |ar, el| ar.push(el.gcd(10)) }

			hash = (1..5).each_with_object({}) { |el, hash| hash.merge!(el => Math.log(el).round(2)) }
			puts hash
		</end>

		<begin 19>
			# The compact method removes all the nil elements from an array:
			a = (1..20).map { |x| x if x.gcd(10) == 2 }
			p a
			p a.compact

			p a
			p a.compact!
			p a

			# If there's no nil elements, the compact! method returns nil
			p a.compact!
			# Be careful not to method chain bang methods!
			p a.compact
		</end>
	EOF
) if $PROGRAM_NAME == __FILE__
