#!/usr/bin/ruby -w
# PART 11

odd, even = proc(&:odd?), proc(&:even?)
define_method(:prime) { |n| !!2.upto(n / 2).map { |x| return false if n % x == 0 } }

a = 'string'
a = 397

# The case subsumption operator is used by case statement:
puts(
	case a
		when String then 'String'
		when Array then 'Array'
		when 0..100 then '0 to 100'
		when 101 then '101'
		when 102, 103 then '102 or 103'
		when method(:prime) then 'prime'
		when odd then 'odd'
		when even then 'even'
		else 'Unknown'
	end
)

puts String === a
puts Array === a
puts (0..100) === 3 #if a.kind_of?(Integer)
puts 101 === a
puts method(:prime) === a    # we can call method with .[](), .[], .call, .(), .===() syntax.
puts odd === a    # we will see proc later, but === can call a proc like .[](), .[], .call, .(), .===() syntax.
puts even === a
