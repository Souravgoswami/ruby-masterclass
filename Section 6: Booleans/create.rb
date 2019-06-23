#!/usr/bin/ruby -w
require 'fileutils'
STDOUT.sync = STDERR.sync = true

module Kernel
	undef p
	define_method(:p) { |*args| args.length == 1 ? args[0].inspect : args }
end

module CodeEvaluator
	def self.write_to_files(files, codes)
		files.replace(files.map.with_index { |f, i| "Part#{i + 1}_#{f}.rb" })

		raise RuntimeError, "#{codes.size} #{codes.size == 1 ? 'code' : 'codes'} given for #{files.size} #{files.size == 1 ? 'file' : 'files' }" unless files.size == codes.size

	 	__index__ =  -1
		while __index__ < codes.size - 1
			__binding__ = binding
			__vals__ = codes[__index__ += 1].to_s.strip.each_line.map { |d| d.strip.then { |e| e.empty? || e.start_with?(/#|=begin|=end/) ? [e, ''] : [e, "# => #{__binding__.eval(e).then { |ev| ev ? ev : 'nil'} }"] } }
			__max_length__ = codes[__index__].each_line.map { |x| x.length }.to_a.max.to_i + 4

			STDOUT.puts "File: #{f = files[__index__]}: ",
				__vals__.map { |val| val[0].strip.ljust(__max_length__) << val[1] }.join("\n").+("\n")
					.tap { |result| File.write(File.join(__dir__, f), result) }, '-' * (f.length + 8)
		end
	end

	def self.eval(*arguments, codes)
		__index__, __arr__ = -1, []

		while __index__ < codes.size - 1
			__binding__ = binding
			__vals__ = codes[__index__ += 1].to_s.strip.each_line.map { |d| d.strip.then { |e| e.empty? || e.start_with?(/#|=begin|=end/) ? [e, ''] : [e, "# => #{__binding__.eval(e).then { |ev| ev ? ev : 'nil'} }"] } }
			__max_length__ = __vals__.map { |x| x[0].length }.to_a.max.to_i + 4
			__arr__.push(
				"Code: #{__index__.next}\n\n" + __vals__.map { |val| val[0].strip.ljust(__max_length__) + val[1] }.join("\n").+("\n") + '-' * __max_length__
			)
		end
		__arr__
	end
end
