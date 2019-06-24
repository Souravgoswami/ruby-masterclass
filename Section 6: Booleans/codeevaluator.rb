#!/usr/bin/ruby -w
STDOUT.sync = STDERR.sync = true

module Kernel
	undef p
	define_method(:p) { |*args| args.length == 1 ? args[0].inspect : args }
end

module CodeEvaluator
	def self.save_as(files, codes)
		raise RuntimeError, "#{codes.size} code#{'s' if codes.size != 1} given for #{files.size} file#{'s' if files.size != 1}" unless files.size == codes.size

		files.replace(files.map.with_index { |f, i| "Part#{i + 1}_#{f}.rb" })
	 	__i__ =  -1

		while __i__ < codes.size - 1
			STDOUT.puts "#{f = files[__i__ += 1]}", evaluate(codes[__i__]).tap { |v| File.write(File.join(__dir__, f), v) }, '-' * 50
		end
		self
	end

	def self.eval(*arguments, codes)
		codes.map.with_index { |code, index| "-> Code #{index.next}:\n\n#{evaluate(code)}\n#{'-' * 50}" }
	end

	def self.evaluate(code)
		__b__ = binding
		__v__ = code.to_s.strip.each_line.map { |l| l.strip.then { |e| [e].<<(e.empty? || e[0] == '#' ? '' : "# => #{__b__.eval(e).then { |v| v ? v : 'nil' } }") } }
		__m__ = __v__.map { |x| x[0].length }.max.to_i + 4
		__v__.map { |v| v[0].ljust(__m__) + v[1] }.join("\n") + "\n"
	end
end
