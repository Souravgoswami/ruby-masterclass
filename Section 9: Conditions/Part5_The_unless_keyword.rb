#!/usr/bin/ruby -w
# PART 5

# The unless statement can be said as opposite of if statement
raining = true

puts 'Raining' if raining
puts 'Not Raining' unless raining
puts '-' * 10

raining = false

puts 'if Raining' if raining
puts 'Not Raining' unless raining
puts '-' * 10


STDIN.gets.to_s.strip.tap { |x| unless x.empty? then puts x else puts 'Empty!' end }
