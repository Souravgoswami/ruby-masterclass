#!/usr/bin/ruby -w
require 'io/console'

puts(
	0.step(180, 36).map do |a|
		0.step(30, 6).map do |b|
			6.times.map { |c| 16.+(a + b + c).to_s.then { |x| "\e[48;5;#{x}m" + x.center(6) + "\e[0m" } }.join
		end
	end.each_slice(STDOUT.winsize[1] / 36)
		.map { |d| 6.times.map { |x| d.map { |y| y.at(x) }.join(?\s) }.join(?\n) + ?\n * 2 }.join
)
