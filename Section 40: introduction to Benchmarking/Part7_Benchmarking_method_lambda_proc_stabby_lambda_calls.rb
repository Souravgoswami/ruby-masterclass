#!/usr/bin/ruby -w
require 'benchmark'

LOOPS = 5000000

def method_call
	i, val = 0, ''

	# WARNING:  method foo will not get defined unless the method bar is called!
	def foo(val)
		val.concat('a')
	end

	while i < LOOPS
		i += 1
		foo(val)
	end
	val
end

def method_call2
	i, val = 0, ''

	while i < LOOPS
		i += 1
		method(:foo).(val)
	end
	val
end

def method_call3
	i, val = 0, ''

	while i < LOOPS
		i += 1
		self.class.instance_method(:foo).bind(self).call(val)
	end
	val
end

def no_method_call
	i, val = 0, ''

	while i < LOOPS
		i += 1
		val.concat('a')
	end
	val
end

def lambda_call
	i, val = 0, ''

	l = lambda { |val| val.concat('a') }

	while i < LOOPS
		l === val
		i += 1
	end
	val
end

def proc_call
	i, val = 0, ''

	p = proc { |val| val.concat('a') }

	while i < LOOPS
		p === val
		i += 1
	end
	val
end

def stabby_lambda_call
	i, val = 0, ''

	sl = ->(val) { val.concat('a') }

	while i < LOOPS
		sl.(val)
		i += 1
	end
	val
end

begin
	Object.private_instance_methods.select { |m| method(m).owner == Object }.-([:DelegateClass]).map(&:to_s).map do |meth|
		[meth.intern, Benchmark.benchmark { |b| b.report(meth) { eval(meth) } }[0].total]
	end.tap { |t| @minmax = t.map { |x| x[1] }.minmax }.select { |x| x[1] == @minmax[0] || x[1] == @minmax[1] }.sort_by { |x| x[1] }.to_h.tap { |x| puts x }
rescue SystemExit, Interrupt, SignalException
	puts
	exit! 0
end
