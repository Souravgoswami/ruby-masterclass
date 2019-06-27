#!/usr/bin/ruby -w

a = 'Once upon a time in a galaxy far far away'
puts a.include?('far')
puts a.include?('spiderman')

def include?(string, substring)
	sub_length = substring.length
	string.length.times { |c| return true if string.slice(c, sub_length).include?(substring) }
	false
end

p include?(a, 'far')
p include?(a, 'spiderman')
