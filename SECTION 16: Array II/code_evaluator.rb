#!/usr/bin/ruby -w
require 'zlib'
STDOUT.sync = STDERR.sync = true
DICTIONARY_PATH = File.join(File.expand_path('..', __dir__), 'Dictionary Lookup', 'words.gz')
$dictionary_lookup = File.readable?(DICTIONARY_PATH)

module Kernel
	undef p
	define_method(:p) { |*args| args.length < 2 ? args[0].inspect : args }
end

def save_as(files, codes)
	codes = codes.strip.split(/\<\s*\W*\/\s*[Ee][Nn][Dd]\s*\>/).tap do |c|
		c.select { |x| x =~ /\<\s*\W+\s*[Bb][Ee][Gg][Ii][Nn]\s*\d*\s*\>/ }.each { |x| c.delete(x) }
		c.select { |x| x =~ /\s*#\s*\<\s*\W*\s*[Bb][Ee][Gg][Ii][Nn]\s*\d*\s*\>/ }.each { |x| c.delete(x) }
	end

	raise RuntimeError, "#{codes.size} code#{'s' if codes.size != 1} given for #{files.size} file#{'s' if files.size != 1}" unless files.size == codes.size
	files.replace(files.map.with_index { |f, i| "Part#{i + 1}_#{f}.rb" })
 	__i__ =  -1
	STDOUT.puts "#{f = files[__i__ += 1]}", evaluate(codes[__i__]).tap { |v| File.write(File.join(__dir__, f), v) }, '-' * 50 while __i__ < codes.size - 1
	self
end

def test(*arguments, codes)
	$words ||= Zlib::GzipReader.new(File.open(DICTIONARY_PATH, 'rb')).readlines.map { |x| x.strip.downcase }.uniq
		.concat(%w(#usrbinruby #) + (0..1000).to_a.map(&:to_s)) if $dictionary_lookup

	formatted_codes = codes.strip.split(/\<\s*\W*\s*\/\s*[Ee][Nn][Dd]\s*\>/).tap do |c|
		c.select { |x| x =~ /\<\s*\W+\s*[Bb][Ee][Gg][Ii][Nn]\s*\d*\s*\>/ }.each { |x| c.delete(x) }
		c.select { |x| x =~ /\s*#\s*\<\s*\W*\s*[Bb][Ee][Gg][Ii][Nn]\s*\d*\s*\>/ }.each { |x| c.delete(x) }
	end.map.with_index { |code, index| "-> Code #{index.next}:\n\n#{evaluate(code)}\n#{'-' * 50}\n" }

	if $dictionary_lookup
		formatted_codes.join.each_line do |l|
			if l.start_with?(/\s*#+\s*/)
				STDOUT.puts(l.split.map { |x| $words.include?(x.downcase.strip.gsub(/[^a-zA-Z0-9_#'"]/, '')) ? x : "\e[1;4;33m#{x}\e[0m"  }.join(' '))
			else
				STDOUT.puts(l)
			end
		end
	else
		STDOUT.puts(formatted_codes)
	end
	self
end

def evaluate(code)
	code.strip!

	# Deal with <begin>, </end> tags and shebang
	head = code.scan(/\<\s*[Bb][Ee][Gg][Ii][Nn]\s*\d*\s*\>/)[0]
	code[0, 0] = "#!/usr/bin/ruby -w\n"
	code.gsub!(head, head.to_s.scan(/\d+/)[0].then { |x| x ? "# PART #{x}\n" : '' }) if head

	# Deal with method definitions
	match_methods = code.scan(/def .*end|.*\{\n+.*\}/m).to_a
	meths = match_methods.map { |x| x.each_line.map { |y| y.strip!.to_s.empty? ? nil : y }.compact }.join(' ; ') unless match_methods.empty?
	match_methods.each do |mm|
		code.gsub!(mm, meths.strip) unless match_methods.empty?
	end

	# Evaluate the code and deal with pretty outputs
	__b__, __inx__ = binding, 0

	begin
		__v__ = code.to_s.strip.each_line.map do |__l__|
			__inx__ += 1
			__l__.strip.then do |__e__|
				[__e__].<<(__e__.empty? || __e__[0] == '#' ? '' : "# => #{__b__.eval(__e__.start_with?(/\s*p/) ? __e__ : 'p ' + __e__).then { |v| v.nil? ? 'nil' : v } }")
			end
		end

		__m__ = __v__.map { |x| x[0].length }.max.to_i + 4
		__v__.map { |v| v[0].start_with?('#') || v[0].empty? ? v[0] : v[0].ljust(__m__) + v[1] }.join("\n") + "\n"

	rescue Exception => e
		Kernel.warn code.each_line.to_a[0...__inx__].map
			.with_index { |x, i| x.strip.then { |y| i.next.to_s + "\t" + (i == __inx__ - 1 ? "\e[1;4;34m#{y}\e[0m" : y) } }
		Kernel.warn "\nLine #{__inx__}: #{e}\n#{e.full_message}"
	end
end
