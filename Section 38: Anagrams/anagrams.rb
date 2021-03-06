#!/usr/bin/ruby -w
WORDFILE = File.join(File.dirname(__FILE__), 'words')

unless File.exist?(WORDFILE)
	puts "#{WORDFILE} doesn't exist. Please get it from here: "\
		'https://github.com/Souravgoswami/ruby-masterclass/blob/master/Part%2038:%20Anagrams/words'
	exit 0
end

WORDS = IO.readlines(WORDFILE).map { |w| w.strip.downcase }.uniq.select { |x| x !~ /[^a-z]/ }
SORTED_WORDS = WORDS.map { |w| w.unpack('c*').sort.pack('c*') }	# This is significantly faster than w.chars.sort.join
WORDS_SIZE = WORDS.size

search = ->(s = WORDS.sample) { s.chars.sort.join.tap { |w| return WORDS_SIZE.times.map { |i| WORDS[i] if SORTED_WORDS[i] == w }.compact } }

p search.('triangle')

# Looks for words with the max anagrams!
STDOUT.sync = true
p WORDS[0..100].map.with_index { |w, i| (print("#{i} => ")) || (p search.(w)) }.tap { |a| @length = a.map(&:length).max }.select { |a| a.length == @length  }
