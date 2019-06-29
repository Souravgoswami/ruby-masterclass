#!/usr/bin/ruby -w
# PART 2

# The while loop repeats until a false condition is met


=begin
while true do    # the do can be omitted if it's multiline block, we can omit it and write `while true`
	puts 'hello'
end

puts 'I will never come here'

while true do puts 'hello' end    # The do is needed here.
=end

a, i = 5, 0

while i < a
	puts i += 1
end

puts '-' * 10

# Just like the statement modifier, if, while can be written at the end of a code:
a, i = 5, 0
puts i += 1 while i < a

# the below code is valid, but it makes few sense because begin is for exception handling.
# This code is criticized by Matz! And you shouldn't use it too!
a, i = 5, 0
begin
	puts i += 1
	puts 'hello'
end while i < a

# In fact, the whole exception handing code can be written! it's a very bad practice!
a, i = 5, 0
begin
	puts i += 1
	puts 'hello'
rescue
else
ensure
end while i < a
