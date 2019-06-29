#!/usr/bin/ruby -w
# PART 10

# The case statement can be used in place of if, and ternary operators.
# But it can do some more stuffs.

print 'Enter your age: '

# Case uses the case subsumption operator. We had a brief intro to it previoiusly
puts(
	'You are ' + case STDIN.gets.to_i
		when 0...3 then 'baby'
		when 3..16 then 'children'
		when 17..30 then 'young adult'
		when 31..45 then 'middle aged adults'
		when 45..60 then 'old adult'
		else 'senior citizen'
	end.split.map(&:capitalize).join(' ').then { |x| (x[0] =~ /[AEIOU]/ ? 'an ' : 'a ') + x }
)
