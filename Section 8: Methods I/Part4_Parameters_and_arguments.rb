#!/usr/bin/ruby -w
# The def keyword can be used to define a method

def foo() 'bar' end
def bar() srand end

# Accepting one argument
def max(a) a * a end

# define_method(:max) { |a| a * a }

# Accepting 3 arguments
# You can also omit the braces
def thud a, b, c
	a + b * c
end

# define_method(:thud) { |a, b, c| a + b * c }

# Arguments with defualt values. In such case,
# a and b is assigned with the default values.
# You can pass either a or b or both.
def qux a = 10, b = 20
	a + b
end

# define_method(:qux) { |a = 10, b = 20| a + b }

# Accepting one or 2 argument.
def flob(a = 'Ruby', b)
	a + b
end

# define_method(:flob) { |a = 'Ruby', b| a + b }

def grault(a, b = 100)
	a + b
end

# define_method(:grault) { |a, b = 100| a + b }

# Accepting 0 or many arguments
def fred(*a)
	puts a.class
	a
end

# define_method(:fred) do |*a|
# 	puts a.class
# 	a
# end

# Accepting one or more than one arguments
def wobble(a, *args)
	a - args.flatten.sum
end

# define_method(:wobble) { |a, *args| a - args.flatten.sum }

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
