#!/usr/bin/env ruby
require 'io/console'

STDOUT.sync = true
GC.start(full_mark: true, immediate_sweep: true)

COLOUR1 = 40
COLOUR2 = 63
COLOUR3 = 196
COLOUR_TITLE = "\e[1;33m"
SWAP_LABEL = "\e[1;38;5;165m"
TIME_FORMAT = ARGV.select { |x| x.start_with?(/(-f|--format)=/) }[0].to_s.split('=')[-1].then { |x| x ? x : "%I:%M:%S:%2N %p" }

class String
	def colourize(colour = [154, 184, 208, 203, 198, 164, 129, 92])
		clr, val = colour.dup.concat(colour.reverse), ''

		each_line do |str|
			str_len, colour_size, i, index = str.length - 1, clr.size, -1, 0
			div = str.length./(colour_size).then { |x| x == 0 ? 1 : x }
			colour_size -= 1

			while i < str_len do
				index += 1 if ((i += 1) % div == 0 && index < colour_size) && i > 1
				val.concat("\e[38;5;#{clr[index]}m#{str[i]}")
			end
		end

		val + "\e[0m"
	end
end

Float.define_method(:lpad) { to_s.then { |x| x.split('.')[1].length == 1 ? x + '0' : x } }
Float.define_method(:rpad) { to_s.then { |x| x.split('.')[0].length == 1 ? '0' + x : x } }

def main(sleep = 0.05)
	split_colour = [203, 198, 199, 164, 129, 93, 63, 33, 39, 44, 49, 48, 83, 118, 184, 214, 208]
	swap, cpu_usage, cpu_bar = '', '', ''

	bars = %W(\xE2\x96\x81 \xE2\x96\x83 \xE2\x96\x85)
	clocks = %W(\xF0\x9F\x95\x9B \xF0\x9F\x95\x90 \xF0\x9F\x95\x91 \xF0\x9F\x95\x92 \xF0\x9F\x95\x93 \xF0\x9F\x95\x94 \xF0\x9F\x95\x95 \xF0\x9F\x95\x96
					\xF0\x9F\x95\x97 \xF0\x9F\x95\x98 \xF0\x9F\x95\x99 \xF0\x9F\x95\x9A)

	loop do
		width = STDOUT.winsize[1]

		# calculate memory usage
		mem_total, mem_available = IO.readlines('/proc/meminfo').then { |x| [x[0], x[2]] }.map(&:split).then { |x| [x[0][1], x[1][1]] }.map { |x| x.to_i./(1024.0).round(2) }
		mem_used = mem_total.-(mem_available).round(2)

		# calculate swap usage
		swap_devs = IO.readlines('/proc/swaps')[1..-1].map(&:split).map { |x| [x[0], x[2], x[3]] }

		# calculate CPU usage
		cpu_usage.clear
		prev_file = IO.readlines('/proc/stat').select { |line| line.start_with?('cpu') }
		Kernel.sleep(sleep)
		file = IO.readlines('/proc/stat').select { |line| line.start_with?('cpu') }

		file.size.times do |i|
			data, prev_data = file[i].split.map(&:to_f), prev_file[i].split.map(&:to_f)

			%w(user nice sys idle iowait irq softirq steal).each_with_index { |e, i| binding.eval "@#{e}, @prev_#{e} = #{data[i += 1]}, #{prev_data[i]}" }

			previdle, idle = @prev_idle + @prev_iowait, @idle + @iowait
			totald = idle + (@user + @nice + @sys + @irq + @softirq + @steal) -
			(previdle + (@prev_user + @prev_nice + @prev_sys + @prev_irq + @prev_softirq + @prev_steal))

			cpu_percentage = ((totald - (idle - previdle)) / totald * 100.0).round(2)
			cpu_bar.replace(cpu_percentage < 33 ? bars[0] : cpu_percentage < 66 ? bars[1] : bars[2])
			cpu_usage.concat("\e[38;5;".+((cpu_percentage < 33 ? COLOUR1 : cpu_percentage < 66 ? COLOUR2 : COLOUR3).to_s).+('m').+("#{cpu_bar} CPU #{i == 0 ? 'Total' : i}: #{cpu_percentage.lpad} %\e[0m\n"))
		end

		# String formatting and colourizing
		tot = "Total: #{mem_total.lpad} MiB"
		used = " \xf0\x9f\x93\x89Used: #{mem_used.lpad} MiB".center(width - tot.length * 2).rstrip
		mem_colour = "\e[38;5;#{mem_used < mem_total / 3 ? COLOUR1 : mem_used < mem_total / 2 ? COLOUR2 : COLOUR3}m"

		swap.clear
		swap_devs.size.times do |sd|
			dev = swap_devs[sd]
			al, av = dev[1].to_f./(1024).round(2), dev[2].to_f./(1024).round(2)

			swap_colour = "\e[38;5;#{av < al / 3 ? COLOUR1 : av < al / 2 ? COLOUR2 : COLOUR3}m"

			allocated = "Total: #{al} MiB"
			usage = " \xF0\x9F\x93\x8AUsed: #{av.lpad} MiB".center(width - allocated.length * 2 - 1).rstrip
			available = swap_colour + " \xF0\x9F\x93\x8AAvailable: #{dev[1].to_f.-(dev[2].to_f)./(1024).round(2).lpad} MiB".rjust(width - allocated.length - usage.length - 2) + "\e[0m"

			swap.concat("#{SWAP_LABEL}\xE2\x80\xA3 #{dev[0]} \xF0\x9F\xA2\x90\e[0m\n" + swap_colour + allocated + usage + available + "\n\n")
		end

		# time
		hr, min, sec = IO.read('/proc/uptime').to_i.then do
			|x| [(x./(3600).to_s.then { |x| x.length == 1 ? '0' + x : x }), (x.%(3600)./(60).to_s.then { |x| x.length == 1 ? '0' + x : x }), (x.%(60).to_s.then { |x| x.length == 1 ? '0' + x : x })]
		end

		current_time = "#{Time.new.strftime(TIME_FORMAT)}"

		STDOUT.print(
			"\e[3J\e[H\e[2J"+ 'System Memory'.center(width).colourize(split_colour.rotate!) +
			('-' * width).colourize(split_colour) +
			mem_colour + tot + "\e[0m" + mem_colour + used + "\e[0m" + mem_colour +
			" \xf0\x9f\x93\x89Available: #{mem_available.lpad} MiB".rjust(width - tot.length - used.length - 2) + "\e[0m\n\n" +
			'Swap'.center(width - 2).colourize(split_colour) + "\n" + '-'.*(width).colourize + swap + "\n" +
			'CPU Usage'.center(width).colourize(split_colour) + "\n" + '-'.*(width).colourize +
			cpu_usage + 'Time'.center(width).colourize(split_colour) + '-'.*(width).colourize(split_colour) + "\n" +
			(clocks.rotate![0] + ' ' + current_time +
			"\xE2\xAC\x86\xEF\xB8\x8F Uptime: #{hr}:#{min}:#{sec}".rjust(width - current_time.length - 2)).colourize(split_colour)
		)
	end
end

begin
	sleep = ARGV.select { |x| x.start_with?(/(-s|--sleep|-d)=/) }[-1].to_s.split('=')[-1].to_f.then { |x| x <= 0 ? 0.125 : x }
	main(sleep)

rescue Interrupt, SignalException, SystemExit
	puts

rescue Errno::ENOTTY
	puts 'No terminal found!'.colourize

rescue Errno::ENOENT => e
	puts ((/linux/ === RbConfig::CONFIG['arch'] ? "System detected: #{RbConfig::CONFIG['arch']}. But" : "This is not a GNU/Linux.") +
		 	" #{e.to_s.split('-')[1..-1].join.strip} is missing.").colourize

rescue Errno::EACCES => e
	puts "Permission denied while trying to read #{e.to_s.split('-')[1..-1].join.strip}".colourize

rescue Exception => e
	Kernel.warn("Oh no! \t#{e}")
	STDOUT.flush
	puts e.backtrace.map { |x| "\t#{x}".colourize }
end
