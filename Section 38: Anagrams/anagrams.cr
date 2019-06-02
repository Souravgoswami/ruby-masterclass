#!/usr/bin/crystal
WORDFILE = File.join(File.dirname(__FILE__), "words")
WORDS = File.read(WORDFILE).split("\n").map { |w| w.strip.downcase }.uniq.select { |x| x !~ /[^a-z]/ }
SORTED_WORDS = WORDS.map { |w| w.chars.sort.join }
WORDS_SIZE = WORDS.size

def search(s)
	w, a = s.chars.sort.join, Array(String).new
	WORDS_SIZE.times.each { |i| a.push(WORDS[i]) if SORTED_WORDS[i] == w }
	a
end

STDOUT.sync = true
a, max = Array(Array(String)).new, 0
p WORDS.map_with_index { |w, i| puts("#{i} => #{a.push(result = search(w)) && result.join(", ")}") || result }.tap { |res| max = res.map { |r| r.size }.max }.select { |r| r.size == max }
