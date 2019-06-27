#!/usr/bin/ruby -w

# Right, a method can be called from another method
def foo(a, b)
	a * b
end

def bar(a, b)
	a + b
end

def baz(a, b)
	foo(a, b) + bar(a, b)
end

p baz(5, 6)        # => 41
p baz(10, 10)    # => 120

define_method(:qux) { |a| baz(a, a) }
p qux(20)
