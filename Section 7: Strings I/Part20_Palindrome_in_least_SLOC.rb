#!/usr/bin/ruby -w
print('Enter a word: ') || puts(STDIN.gets.to_s.strip.downcase.then { |x| x.empty? ? '' : (x.concat(x.reverse == x ? ' is' : ' doesn\'t look like')) + ' a Palindrome' })
