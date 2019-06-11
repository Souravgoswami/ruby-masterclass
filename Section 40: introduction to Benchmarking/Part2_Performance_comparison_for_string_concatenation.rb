#!/usr/bin/ruby -w
require 'benchmark'

LOOPS = 200_000

def plus
	i, str = 0, ''
	while i < LOOPS
		i += 1
		str += 'a'
	end
	str.length
end

def concat
	i, str = 0, ''
	while i < LOOPS
		i += 1
		str.concat('a')
	end
	str.length
end

def shovel
	i, str = 0, ''
	while i < LOOPS
		i += 1
		str.<<('a')
	end
	str.length
end

Benchmark.benchmark do |b|
	b.report('plus') { plus }
	b.report('concat') { concat }
	b.report('shovel') { shovel }
end
