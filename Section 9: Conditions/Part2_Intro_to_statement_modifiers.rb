#!/usr/bin/ruby -w
# PART 2

=begin
	https://stackoverflow.com/a/1962881/11089758
	Statement-modifiers make ruby behave more like English, which is nice:

	if it rains, stay home
	stay home if it rains
=end

# Ruby has a concept of statement modifiers, where a
# control structure can be moved after an expression:

raining = true

if raining
	puts 'Stay Home'
end

# The above can be written as:
puts 'Stay Home' if raining

puts '-' * 10

5.times do |i|
	puts i
end if raining

puts '-' * 10

5.times { |i| puts i } if raining

i = 0
