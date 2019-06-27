#!/usr/bin/ruby -w
# The def keyword can be used to define a method

def foo
	return 'bar'
end

def bar
	return srand
end

p foo
p bar

def max(a)
	return a * a
end

def thud(a, b, c)
	return a + b * c
end

def qux(a = 10, b = 20)
	return a + b
end

def flob(a = 'Ruby', b)
	return a + b
end

def grault(a, b = 100)
	return(a + b)
end

def fred(*a)
	puts a.class
	return a
end

def wobble(a, *args)
	return a - args.flatten.sum
end

p foo
p bar
p max(5)
p thud(1, 3, 5)

p qux(5)
p qux(1, 1)
p qux

p flob('Ruby', ' is amazing')
p flob(' is awesome')

a = grault(1, 1)
puts a * a
p grault(1)

p fred(1, 2, 3, 'a', 'b', 'c')

puts wobble(100, 1, 2, 3, 4, 5).then { |x| x + x }
puts wobble(100)
puts wobble(100) + wobble(100, (1..5).to_a)
