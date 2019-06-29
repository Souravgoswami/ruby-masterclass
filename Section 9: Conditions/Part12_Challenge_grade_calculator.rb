#!/usr/bin/ruby -w
# PART 11

=begin
	Here are the grades:
		0 ... 25 => D
		25 ... 35 => C
		35 ... 45 => C+
		45 ... 55 => B
		55 ... 65 => B+
		65 ... 75 => A
		75 ... 85 => A+
		85 ... 100 => A*
=end

# Here print will always return nil, so let's use the | or `or` eager operator
print('Type out the percentage: ') or (p = STDIN.gets.to_i.abs)

# 1: With if ... else:
puts(
	'Your Grade is: ' +
		if p < 25 then 'D'
		elsif p < 35 then 'C'
		elsif p < 45 then 'C+'
		elsif p < 55 then 'B'
		elsif p < 65 then 'B+'
		elsif p < 75 then 'A'
		elsif p < 85 then 'A+'
		else 'A*'
		end
)

# 2: Using case:
puts(
	'Your Grade is: ' + case p
		when 0...25 then 'D'
		when 25...35 then 'C'
		when 35...45 then 'C+'
		when 45...55 then 'B'
		when 55...65 then 'B+'
		when 65...75 then 'A'
		when 75...85 then 'A+'
		else 'A*'
	end
)

# 3: With ternary operators (shortest)
puts('Your Grade is: ' + (p < 25 ? 'D' : p < 35 ? 'C' : p < 45 ? 'C+' : p < 55 ? 'B' : p < 65 ? 'B+' : p < 75 ? 'A' : p < 85 ? 'A+' : 'A*'))
