#!/usr/bin/ruby -w
require_relative(File.join(__dir__, 'code_evaluator'))

puts save_as(
	%w(
		Intro_to_Range_Objects
		The_size_length_count_methods
		The_min_max_minmax_methods
		The_-_min_by_-_max_by_-_minmax_by_-_methods
		The_include?_method
		The_cover?_method
		The_Kernel#rand_or_rand_methods
		The_-_exclude_end?_-_method
		The_each_map_collect_reduce_inject_methods
		Quiz_Converting_range_of_hexadecimal_to_decimal
		The_partition_and_-_group_by_-_methods
	),
	<<~'EOF'
		<begin 1>
			# A range is created (as we have seen in Section 9 -> 10, 11)
			# by putting two Integer or Float in () seperated with either
			# .. or ...
			p (1..9).class
			# p 1..9.class    # Error here

			p ('a'..'z')    # Alphabetical Range
			p ('a'..'f').to_a
			p ('a'...'f').to_a
			p (100..1).to_a

			# A numerical range is simply created like this: (int..last_int)
			# The to_a method converts a Range into an Array!
			p (0..9).to_a
			p (0...9).to_a

			# Or we can use:
			p Range.new(1, 5)
			p Range.new('a', 'h').to_a

			# Well, we can even create ranges in most of the languages
			p Range.new('খ', 'চ').to_a
			p Range.new('ख', 'च').to_a

			# So that's a shortcut while creating an Array.
			# But Ranges can do a lot of works we will be seeing
			# thoroughout the course!

			# The last and complementary end method returns the
			# last value of the range whether it excludes end (...) or not (..)
			p (1..9).last
			p (1...9).last

			p Range.new('খ', 'চ').last
			p Range.new('খ', 'চ').end

			p (1..9).end
			p (1...9).end

			p ('a'..'z').end

			p ('a'..'zzz').then { |x| x.end == x.last }
			p ('a'...'zzz').then { |x| x.end == x.last }
		</end>

		<begin 2>
			# the size methods can be used to get the size of the range
			p (1..100).size
			p (1...100).size
			p (1..100_000_000_000_000).size.to_s.reverse.gsub(/\d{1,3}/).to_a.join(',').reverse

			# The count method can be used for counting the occurence of something:
			p (1..100).count { |x| x.odd? }
			# similar to:
			p (1..100).count(&:odd?)
			p ('a'..'z').count { |x| x == 'ruby' }

			# Size will not work expectedly if you are using alphabetical ranges:
			p ('a'..'z').size
			p ('a'..'z').count
			# In the above case, the size method should be used on numerical ranges
			# As ruby documentation (ri) says!

			# The do ... end block can also be used
			p Range.new('a', 'z').count do |x| x.ord == 97 end
		</end>

		<begin 3>
			# The max method returns the maximum value
			p (1..1000).max
			p ('a'..'zzzz').max

			# The min method returns the minimum value
			p (1..1000).min
			p ('A'...'z').min    # A has minimum ASCII in 'A' to 'z'
			p 'A'.ord

			# The minmax method returns an array consisting of the
			# min and max elements:
			a = (1..1000)
			p [a.min, a.max]
			p a.minmax
		</end>

		<begin 4>
			# The result of the min can also be changed:
			p ('a'..'zzz').min_by { |x| x.length }
			# the above can be replaced with:
			p ('a'..'zzz').min_by(&:length)

			p ('a'..'zzz').min_by(4) { |x| x }
			p ('a'..'zzz').min_by(4, &:next)

			# max_by:
			p ('a'..'zzz').max_by(&:length)
			p ('a'..'zzz').max_by(2, &:next)

			# minmax_by:
			p ('a'...'zzz').minmax_by(&:length)
			p ('a'...'zzz').minmax_by(&:next)

			# getting random elements from a range (just for demo)
			# Don't use them instead of Kernel.rand / Random.rand
			# SecureRandom.rand
			p (1...100).min_by { rand }
			p rand(1...1000)
			p (1...1000).max_by { rand }
			p (1...1000).minmax_by { rand }
			p [Kernel.rand(1...1000), Kernel.rand(1...1000)]
		</end>

		<begin 5>
			# The include method can be used to check if the range
			# includes something or not:
			a = 1..5
			p a.include?(5)
			p a.include?(6)
			p a.include?('a')
			all = ('a'..'zzzz')

			p all.count
			p all.include?('nice')
			p all.include?('hair')
			p all.include?('xdg')
			p all.include?('ruby')
		</end>

		<begin 6>
			# The cover method works like the include:
			a = (1..10)
			p a.cover?(5)
			p a.cover?('hello')
			p ('a'..'z').cover?('hey')
			p ('a'..'h').cover?('hey')
			p ('a'..'i').cover?('hey')
		</end>

		<begin 7>
			# The rand method can generate random numbers!
			# In the IO section we will see how these things work!
			p rand(1..100)
			p Kernel.rand(1..100)
			p Random.rand(1..100)

			# When you call rand it calls Kernel.rand!
			# Random.rand is not Kernel.rand, but it's similar...
			# Note that you can't create alphabetical ranges!
			# Except:
			p 10.times.map { rand(97..122).chr }.join
		</end>

		<begin 8>
			# You see, (1...9) excludes the 9!
			a, b = 1...9, 1..9

			p a.last
			p b.last

			p a.exclude_end?
			p b.exclude_end?
			p a.to_a
			p b.to_a
		</end>

		<begin 9>
			# The each method can be used to iterate over a Range
			(1..10).each { |x| puts x }
			('a'..'z').each { |val| puts val.next }

			# The map method returns an Array:
			a = 'a'..'z'
			p a.map { |x| x }
			p a.map { |x| 'Hi ' + x.capitalize }

			# The collect method is exact copy of map:
			p a.collect { |x| 'Hi ' + x.capitalize }

			# The reduce method iterates over a range, and does
			# some certain operation on two items
			p (1..5).reduce(:*)    # factorial
			p (1..10).reduce(:+)
			p (1..10).reduce(5, :+)
			p (1..10).reduce(10, :+)
			p (1..10).reduce(100, :+)

			# you noticed, it calls the * method with the next argument
			p ('a'..'z').reduce(:+)
			p ('a'..'z').reduce('a', :+)
			p ('a'..'z').reduce(:concat)

			p ('a'..'z').reduce([]) { |array, item| array.push(item) }
			p (1..9).reduce('') { |string, item| string.concat(item.to_s) }

			# The inject method is same to reduce
			p ('a'..'z').inject(:concat)
			p ('a'..'z').inject(String.new) { |str, item| str.concat(item) }
		</end>

		<begin 10>
			# Quiz: Converting range of hexadecimal to decimal
			p (0x00..0xF).to_a
		</end>

		<begin 11>
			# The partition method returns 2 arrays
			# The arrays contain the elements of the enum
			# for which the block evaluates to true, and false
			# respectively

			p (1..10).partition { |x| x.odd? }
			p (1..10).partition(&:odd?)
			p (1..10).partition(&:integer?)
			p (1..10).partition &:even?
			p ('a'..'z').partition { |x| x[-1].ord.odd? }

			# The group by method is similar but it returns a hash
			# The hash contains true and false values:
			p (1..10).group_by(&:odd?)
			p ('a'..'z').group_by { |x| x[-1].ord.odd? }
		</end>
	EOF
) if $PROGRAM_NAME == __FILE__
