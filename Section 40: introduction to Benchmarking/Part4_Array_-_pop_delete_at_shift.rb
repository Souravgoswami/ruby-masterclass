#!/usr/bin/ruby -w
require 'benchmark'

LOOPS = 100000

def pop
	a = Array.new(LOOPS) { |i| "element #{i}" }
	a.pop until a.empty?
	a
end

def delete_at
	a = Array.new(LOOPS) { |i| "element #{i}" }
	a.delete_at(0) until a.empty?
	a
end

def shift
	a = Array.new(LOOPS) { |i| "element #{i}" }
	a.shift until a.empty?
	a
end

Benchmark.benchmark do |b|
	b.report('pop') { pop }
	b.report('delete_at') { delete_at }
	b.report('shift') { shift }
end
