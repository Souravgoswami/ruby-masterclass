#!/usr/bin/ruby -w
# PART 10

# The case statement can be used in place of if, and ternary operators.
# But it can do some more stuffs.

print 'Enter your age: '

# Case uses the case subsumption operator. We had a brief intro to it previoiusly
puts(
	'You are a ' + case STDIN.gets.to_i
		when 0...3 then 'baby'
		when 3..16 then 'children'
		when 17..30 then 'young adult'
		when 31..45 then 'middle aged adults'
		else 'old adult'
	end.split.map(&:capitalize).join(' ')
)
