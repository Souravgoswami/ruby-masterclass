#!/usr/bin/ruby
require_relative(File.join(__dir__, 'code_evaluator'))
$dictionary_lookup = false

save_as(
	%w(
		Intro_to_hash_objects
		Adding_key_and_value_pairs_with_bracket_syntax
		The_fetch_method_on_hash
		The_store_method
		The_merge_and_merge!_methods
		The_clear_method
		The_length_and_empty?_methods
		The_keys_and_values_methods
		The_each_method_for_iteration
		The_flatten_method_and_conversion_of_hash_into_array_and_vice_versa
		Quiz_Restaurant_Bills
		The_sort_and_-_sort_by_-_methods
		Default_values
		The_-_default_proc_-_method
		The_select_and_reject_methods
	),
	<<~'EOF'
		<begin 1>
			# As we have seen array stores (a) value(s) called element(s).
			# Hash objects store key value pairs.
			# Arrays store elements sequentially. But you shouldn't trust
			# hash for storing sequential data.
			# Hashes are very fast while looking up for items!
			# Arrays are faster if you need to iterate over all the items!

			# A literal hash is created with:
			a = {'a' => 'Hello', 'b' => 'world'}
			b = {5 => 6, true => false, false => nil}
			p a
			# Any value can be fetched with the key:
			p a['a']
			p a['b']

			p b[5]
			p b[false]
			p b[100]

			# Hashes are mutable. That means you can also use
			# The bracket syntax to add key-value pairs.
			b[10] = 'Ruby'
			p b
			p b[10]

			b[5] = 1000
			p b

			# Array can store duplicate items.
			# But hashes can't. The key has to be unique. The value can be
			# unique or non-unique

			a = {'Ruby' => 'Java (JRuby)', 'GCC' => 'C', 'Python' => 'C', 'Ruby' => 'C'}
			# warning: key "Ruby" is duplicated and overwritten on line ...

			p a['Ruby']

			# Well, it can serve as a lookup table. Where you have student roll_numbers
			# clipped with their respective names.
			# Remember that the key has to be unique, otherwise the value will get overridden...
			students = {1 => 'Zane Mercado', 2 => 'Haylie Walker', 3 => 'Reily Suarez', 4 => 'Siena Yu'}

			p students[1]    # Roll 1
			p students[-1]    # Roll -1
			p students[4]    # Roll 4
		</end>

		<begin 2>
			# This is a redundant section that focuses on adding key-value pairs in more detail:
			# It's very common to see symbols used as hash keys:
			elements = {:a => 'Argon', :b => 'Boron', :c => 'Chromium', :d => 'Dubnium', :e => 'Erbium'}
			p elements[:a]
			p elements[:d]

			# But we have another syntax for symbols only!
			elements = {h: 'Helium', n: 'Neon', a: 'Argon', k: 'Krypton', x: 'Xenon'}
			p elements[:h]
			p elements[:x]

			# Now let's use the bracket syntax:
			elements[:r] = 'Radon'
			p elements
			p elements[:r]
		</end>

		<begin 3>
			# The fetch method
			fruits = {a: :apple, b: :banana, c: :cherry, d: :date, e: :eggfruit}
			p fruits[:a]
			p fruits.fetch(:a)

			# Like Array#fetch (which raises IndexError),
			# Hash#fetch will raise KeyError if the key is not found
			# p fruits.fetch(:f)    # KeyError
			p fruits.fetch(:x) { |key| puts "Key #{key.inspect} not found!" }
		</end>

		<begin 4>
			# The store method stores key-value paris to a hash
			# and returns a string
			a = b = Hash.new
			a.store(1, 'C#')
			p a

			a.store(1, 'Ruby')
			p a

			p a.store(2, 'Crystal')
			p a.store(3, 'C++')
			p a.store(4, 'Rust')

			p a
			p b
	 	</end>

		<begin 5>
			# The merge method can be used to merge
			# a hash into another hash:
			a, b = {a: 100, b: 200}, {b: 300, c: 400, d: 500}
			p a.merge(b)

			# Another example:
			v = "\xf0\x9d\x93\xa9"
			ch = ('a'..'z').reduce({}) { |h, c| h.merge(c.intern => v = v.next) }

			'ruby'.downcase.chars.map { |c| ch[c.intern] }.join

			STDIN.gets.then { |x| x ? x : 'test' }.downcase.chars.map { |c| ch[c.intern] }.join

			# The merge method also takes a block:
			p a
			p a.merge(b) { }
			p a.merge(b) { |key, val1, val2| val1 + val2 }
			p a.merge!(b) { |_, x, y| x - y }
			p a
		</end>

		<begin 6>
			# The clear method clears a hash and returns itself.
			a = {a: 'apple', b: 'ball'}
			p a

			a.clear
			p a

			# Because clear returns the itself object, method
			# chaining is possible!
			a.clear.store(4, 5)
			p a
		</end>

		<begin 7>
			# The length / size methods returns the length of the hash
			a = {a: 'argon', b: 'berylium', c: 'cobalt'}
			p a.length
			p a.size

			# The empty method returns true if the array is empty
			p a.empty?
			p({}.empty?)
			p a.clear.empty?
			p a.empty?
		</end>

		<begin 8>
			# The keys methods rerturns all the hash
			# keys as an array, and the values method returns all the values
			# as an array:
			hash = {a: 'hello', 1 => 'world', true => false}
			p hash.keys
			p hash.values

			p hash.keys.each { |x| puts x }
			# The each_key iterates over all the key and returns the self hash
			p hash.each_key { |x| puts x }

			# Hash#values
			p hash.values
			# the each_value iterates over all the values and returns the self hash
			p hash.values.each { |x| puts x }
			p hash.each_value { |x| puts x }.store(:b, 5)

			p hash

			# Not to confuse, there's a method called hash on every object.
			# p self.hash()    # No relation with a hash object whatsoever.
		</end>

		<begin 9>
			# The each method for iteration
			hash = (:a..:f).zip(1..6).to_h
			hash.each { |key, value| puts key }
			hash.each { |x| x.display }
			# Here x[0] is the key and x[1] is the value
			hash.each do |x| puts x[0] end

			# We can also use reduce / inject and map / collect methods on a hash
			power_of_3 = (1..8).reduce({}) { |h, x| h.merge(x => x ** 3) }
			power_of_3.map(&:last)

			ascii = hash.reduce({}) { |h, x| h.merge(x[0].to_s => 96 + x[1]) }
			ascii['a']
			ascii['b'].chr
		</end>

		<begin 10>
			# The flatten method and conversion of an array into hash
			# The flatten method can be used to convert a hash into an array:
			a = {a: 1, b: 2, c: 3}
			p a.flatten
			p a.flatten.then { |x| [x[0], x[-1]]}

			# It actually flattens every key and value. But the to_a method
			# can convert a hash into a multi-dimensional array:
			p a
			p a.to_a
			p a.to_a[1][1]

			# The to_h method can convert an array into a hash
			# The first item has to be an array [[]]
			# [:a, 1].to_h    # TypeError
			[[:a, 1]].to_h
			[[:a, 1], [:b, 2]].to_h

			ary = ('a'..'d').zip(1..4)
			p ary
			p ary.to_h
		</end>

		<begin 11>
			# Quiz_Restaurant_Bills
			# Let's assume we have 2 restaurants side by side
			pearl_restaurant = {options: {breakfast: 500, lunch: 750, evening: 750, dinner: 1250}, discount: {day: 250, all: 750}, coupon: {rubyists: 100}}
			grand_restaurant = {options: {breakfast: 1500, lunch: 2500, evening: 3500, dinner: 5000}, discount: {day: 500, all: 1250}, coupon: {rubyists: 250} }

			# Say you 3 are going to the restaurants. You two like to go to grand_restaurant, and
			# The other three are in pearl_restaurant.
			# You all would like to eat all the day there. Now calculate in a hash
			# the cost of breakfast, lunch, evening, and dinner.

			total = pearl_restaurant.merge(grand_restaurant) { |_, x, y| x.merge(y) { |__, a, b| a * 3 + b * 2 } }
			# discount, coupons = total[:discount].values.sum, total[:coupon].values.sum
			p total[:options].values.sum - total[:discount].values.sum - total[:coupon].values.sum
		</end>

		<begin 12>
			# The sort methods on a hash object returns an array:
			languages = {ruby: :interpreted, crystal: :compiled, perl: :interpreted, python: :intrpreted, c: :compiled, cpp: :compiled, go: :compiled}
			p languages.sort    # Alphabetical sort
			p languages.sort_by { |x, y| y <=> x }
			p languages.sort_by { |x, y| x <=> y }

			# Randomizing elements:
			p languages.sort_by { rand }
			p languages.to_a.shuffle
		</end>

		<begin 13>
			# When you use the bracket syntax to fetch an item,
			# It returns the value of key if the key exists.
			# Else, it returns nil by default. The behaviour can be
			# changed with the default method on a proc
			books = {matz: 'The Ruby Programming Language'}
			books[:black] = 'The Well-Grounded Rubyist'

			p books.default
			books.default = 0
			p books.default

			p [:something]
			p books[:matz]

			books.default = {}
			p books['hello']
			p books['matz']

			# But fetch will raise KeyError and not the
			# default value if the key doesn't exist. You can
			# use a block to warn about that...
			p books.fetch('hi') { |x| puts x }
		</end>

		<begin 14>
			# The default_proc method can be used
			# for enabling certain tasks like:
			hash = Hash.new('a' => 'apple')
			hash.default_proc = proc { |x, y| y * 2 }

			# Now rather than fetching elements it will do
			# something weird
			hash['a']

			hash.default_proc = proc { |h, k| h[k] = k * k }
			p hash[4]
			p hash

			p = hash.default_proc
			a = []
			p p.call(a, 2)
			p a

			# Another way:
			hash = Hash.new { |h, k| h[k] = k * k }
			p hash[2]
			p hash

			a = []
			hash.default_proc.(a, 5)
			p a

		</end>

		<begin 15>
			# The select and reject methods
			hash = {'192.168.2.3' => 'archlinux', '192.168.2.6' => 'OpenSUSE'}
			hash.reject { |x, y| y == 'archlinux' }
			p hash

			# The reject! method modifies the original hash but doesn't
			# change the memory location
			p hash.reject! { |x, y| y == 'OpenSUSE' }
			p hash

			hash.replace({'192.168.2.3' => 'a', '192.168.2.6' => 'b', '192.169.2.8' => 'c'})
			# The select method select an item from the hash
			p hash.select { |x| x.start_with? '192.168' }
			p hash

			# The select! method modifies the original hash:
			p hash.select! { |x| x.start_with?('192.168') }
			p hash

			# Another example:
			a = {1 => 'ruby', 2 => 'python', 3 => 'perl', 4 => 'rust', 5 => 'racket'}
			p a.select { |_, n| n.start_with?('r') }
		</end>
	EOF
) if $PROGRAM_NAME == __FILE__
