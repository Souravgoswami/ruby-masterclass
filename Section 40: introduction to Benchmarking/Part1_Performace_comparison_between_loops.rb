#!/usr/bin/ruby -w
require 'benchmark'

LOOPS = 20_000_000 - 1

def loop_times()
	j = 0
	LOOPS.times { |i| j += i }
	j
end

def loop_for
	j = 0
	for i in (0..LOOPS) do j += i end
	j
end

def loop_while()
	i = j = 0
	while i <= LOOPS
		j += i
		i += 1
	end
	j
end

def loop_until
	i  = j = 0
	until i > LOOPS
		j += i
		i += 1
	end
	j
end

def loop_loop
	i = j = 0
	loop do
		j += i
		i += 1
		break if i > LOOPS
	end
	j
end

def loop_each
	j = 0
	(0..LOOPS).each { |i| j += i }
	j
end

def loop_upto
	j = 0
	0.upto(LOOPS) { |i| j += i }
	j
end

def loop_downto
	j = 0
	LOOPS.downto(0) { |i| j += i }
	j
end

def loop_step
	j = 0
	0.step(LOOPS) { |i| j += i }
	j
end

def loop_lazy_each
	j = 0
	(0..LOOPS).lazy.each { |i| j += i }
	j
end

Benchmark.benchmark do |b|
	b.report(:times) { loop_times }
	b.report(:for) { loop_for }
	b.report(:while) { loop_while }
	b.report(:until) { loop_until }
	b.report(:loop) { loop_loop }
	b.report(:each) { loop_each }
	b.report(:upto) { loop_upto }
	b.report(:downto) { loop_downto }
	b.report(:step) { loop_step }
	b.report(:loop_lazy_each) { loop_lazy_each }
end
