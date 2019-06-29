#!/usr/bin/ruby -w
# PART 4

# If can be chained with other conditions:

if 1 + 1 == 1
	puts '1st'
elsif 2 + 2 == 5
	puts '2nd'
elsif 2 + 3 == 5
	puts '3rd'
else
	puts 'None are true'
end

a = if 1 + 1 == 500
	'1st'
elsif 2 + 2 == 4
	'2nd'
end

puts a

print('Enter a name of programming language: ')
name = STDIN.gets.to_s.strip.downcase

name << (
	if name == 'perl' then ' was created by Larry Wall'
	elsif name == 'java' then ' was created by James Gosling'
	elsif name == 'ruby' then ' was created by Yukihiro Matsumoto'
	elsif name == 'haskell' then ' ... A very long list by Google'
	elsif name.eql?('lisp') then ' was created by John McCarthy'
	elsif name.eql?('c') then ' was created by Dennis Ritchie'
	elsif name == 'c++' then ' was created by Bjarne Stroustrup'
	elsif name == 'javascript' then ' was created by Brendan Eich'
	elsif name == 'crystal' then ' was created by Juan Wajnerman'
	elsif name == 'rust' then ' was created by Graydon Hoare'
	elsif name == 'python' then ' was created by Guido van Rossum'
	elsif name == 'php' then ' was created by Rasmus Lerdorf'
	else 'Not yet added XD'
	end
)

puts name
