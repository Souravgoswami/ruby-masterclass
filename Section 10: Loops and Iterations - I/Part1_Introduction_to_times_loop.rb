#!/usr/bin/ruby -w
# PART 1

# We have used the times loop many times before
# times loop can be called on an Integer object

5.times do |i|
	puts i % 3
	puts 'hello world'
end

puts '-' * 10

5.times { |i| puts i % 3, 'hello world' }
50.times do print rand(97..122).chr end
