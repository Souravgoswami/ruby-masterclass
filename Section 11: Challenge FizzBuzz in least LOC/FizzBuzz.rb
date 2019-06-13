#!/usr/bin/ruby -w

100.times { |n| puts n % 15 == 0 ? 'FizzBuzz' : n % 3 == 0 ? 'Fizz' : n % 5 == 0 ? 'Buzz' : n }
