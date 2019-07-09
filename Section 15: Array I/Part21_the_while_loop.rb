#!/usr/bin/ruby -w
# The while loop can be used to iterate over an
# array. There are other loops like for, each,
# map / collect.
# But let's look at the while, until, and times loop for now

a = [1,2,3,4,5]
i = 0

while i < a.size
	puts a[i]
	i += 1
end

puts '-' * 10

i = -1
while i < a.size - 1 do puts a[i += 1] end

puts '-' * 10

i = -1
puts a[i += 1] while i < a.size - 1

puts '-' * 10

i = -1
puts a[i += 1] until i == a.size - 1

puts '-' * 10
a = %w(once upon a time in a galaxy far far away!)
ch = ''
a.size.times do |i|
	a[i].capitalize.chars.each { |x| ch.concat(x + '-') }
	ch.chop!.concat('_')
end
ch.chop!

puts ch
