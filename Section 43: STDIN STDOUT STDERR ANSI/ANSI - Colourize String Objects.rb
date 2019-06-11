#!/usr/bin/ruby -w

class String
	gradients =  [[154, 184, 208, 203, 198, 164, 129, 92], [63, 33, 39, 44, 49, 83, 118], (34..39), (70..75), (214..219), (40..45),
		[203, 198, 199, 164, 129, 93, 63, 33, 39, 44, 49, 48, 83, 118, 184, 214, 208]].map(&:to_a)
	@@colourset = gradients.map { |x| x.dup.concat(x.reverse) } << gradients.map { |x| x.dup.reverse.concat(x.reverse) }

	def colourize(blink = false)
		val = ''
		each_line do |el|
			colour, colour_size = @@colourset[0].then { |ss| [ss, ss.size] }
			div, index, i = (el.length / colour_size).then { |c| c == 0 ? 1 : c }, 0, -1

			while i < el.length
				index += 1 if i > 1 && i % div == 0 && index < colour_size
				val.concat("\e[38;5;#{colour[index]}m#{el[i += 1]}")
			end

			@@colourset.rotate!
		end

		val.concat("\e[0m")
	end
end

Kernel.define_method(:decorate) { |*a| puts a.map { |arg| arg.to_s.colourize } }

puts ('.' * 100).colourize
decorate(100.times.map { rand(97..122).chr }.join, [1,2,3], {a: :b})
