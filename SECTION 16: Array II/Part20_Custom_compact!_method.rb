#!/usr/bin/ruby -w
# PART 20

def compact!(ary)
	final_ary = []
	ary.each { |x| final_ary.push(x) unless x.nil? }
	# But if we do do unless x it will also discard false values
	ary.replace(final_ary)
end

def compact_while(ary)
	final_ary, i, iter = [], -1, ary.size - 1
	final_ary.push(ary[i]) unless ary[i += 1].nil? while i < iter
	final_ary
end

ary = Array(1..100).map { |x| x if x.odd? }.append(false, true, 'abcd', 'efgh', [], {}, (1..Float::INFINITY)).shuffle
p ary

p ary.compact
p compact!(ary)
p ary

puts '-' * 200
ary.replace(Array(1..100).map { |x| x if x.odd? }.push(false).shuffle)

p ary
p compact_while(ary)
p ary.compact
p compact_while(ary) == ary.compact
