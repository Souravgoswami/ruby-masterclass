#!/usr/bin/ruby -w

WORDFILE = File.join(File.dirname(__FILE__), 'words')

unless File.exist?(WORDFILE)
	puts "#{WORDFILE} doesn't exist."
	exit! 0
end

WORDS = IO.readlines(WORDFILE).map { |w| w.strip.downcase }[1..-1].uniq.select { |x| x.scan(/[^a-z]/).empty? }
SORTED_WORDS = WORDS.map { |w| w.chars.sort.join }
WORDS_SIZE = WORDS.size

def search(word = WORDS.sample)
	sorted_word = word.chars.sort.join
	WORDS_SIZE.times.map { |i| WORDS[i] if SORTED_WORDS[i] == sorted_word }.compact
end

p search('triangle')
