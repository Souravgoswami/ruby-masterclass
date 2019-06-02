WORDFILE = File.join(File.dirname(__FILE__), "words")

WORDS = File.read(WORDFILE).split("\n").map { |w| w.strip.downcase }.uniq.select { |x| x !~ /[^a-z]/ }
SORTED_WORDS = WORDS.map { |w| w.chars.sort.join }	# This is significantly faster than w.chars.sort.join
WORDS_SIZE = WORDS.size

def search(s)
	w, a = s.chars.sort.join, [""]
 	WORDS_SIZE.times { |i| a.push(WORDS[i]) if SORTED_WORDS[i] == w }
	a[1..-1]
end

WORDS.each_with_index do |w, i|
	puts("#{i} => #{search(w)}")
end
