#!/usr/bin/ruby -w
require 'benchmark'

LOOPS = 100_000

def plus
	i, a = 0, []
	while i < LOOPS
		i += 1
		a += ['1st']
		a += ['2nd']
	end
	a
end

def concat
	i, a = 0, []
	while i < LOOPS
		i += 1
		a.concat(['1st'])
		a.concat(['2nd'])
	end
	a
end

def push
	i, a = 0, []
	while i < LOOPS
		i += 1
		a.push('1st')
		a.push('2nd')
	end
	a
end

def append
	i, a = 0, []
	while i < LOOPS
		i += 1
		a.append('1st', '2nd')
	end
	a
end

def shovel
	i, a = 0, []
	while i < LOOPS
		i += 1
		a << '1st' << '2nd'
	end
	a
end

def unshift
	i, a = 0, []
	while i < LOOPS
		i += 1
		a.unshift('2nd')
		a.unshift('1st')
	end
	a
end

def new
	Array.new(LOOPS * 2) { |i| i.even? ? '1st' : '2nd' }
end

Benchmark.benchmark do |b|
	b.report('plus') { plus }
	b.report('concat') { concat }
	b.report('push') { push }
	b.report('append') { append }
	b.report('shovel') { shovel }
	b.report('unshift') { unshift }
	b.report('new') { new }
end
