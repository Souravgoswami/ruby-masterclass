#!/usr/bin/ruby -w
require 'benchmark'

ARRAY_SIZE, ITEMS = 3000000, 5
ARRAY = Array.new(ARRAY_SIZE) { |i| i % ITEMS }.shuffle

def uniq_sort
	ARRAY.uniq.sort
end

def uniq_sort2
	(0...ITEMS).to_a & ARRAY
end

def uniq_sort3
	(ARRAY | []).sort
end

Benchmark.benchmark do |b|
	b.report('uniq_sort') { uniq_sort }
	b.report('uniq_sort2') { uniq_sort2 }
	b.report('uniq_sort3') { uniq_sort3 }
end
