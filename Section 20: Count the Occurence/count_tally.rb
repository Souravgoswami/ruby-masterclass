#!/usr/bin/ruby -w

def tally(argument)
	argument.dup.then { |arg| arg.reduce({}) { |hash, a| hash.merge!(a => arg.count(a)).tap { arg.delete(a) } } }
end

a =  Array.new(5000) { 2.times.map { rand(97..122).chr }.join }
p tally(a)
