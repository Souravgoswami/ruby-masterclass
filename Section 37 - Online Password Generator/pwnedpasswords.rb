#!/usr/bin/ruby -w
require 'net/http'
require 'digest'
require 'io/console'

def sha1(password)
	s = Digest::SHA1.new
	s << password
	s.hexdigest
end

def pwnedpasswords(password)
	sha1 = sha1(password.to_s).upcase
	head, tail = sha1[0..4], sha1[5..-1]

	begin
		Net::HTTP.get(URI("https://api.pwnedpasswords.com/range/#{head}")).each_line.find { |el| tail == el.strip.split(':')[0] }.to_s.strip.split(':')[-1].to_i
	rescue SocketError
		Kernel.warn "Looks like an internet connection issue. Do you have an internet connection?"
		exit!
	rescue Exception => e
		Kernel.warn "Uh Oh! An Error Caught:\n\n#{e}"
		exit!
	end
end

define_method(:generate) { |n = rand(12..16)| n.times.map { [rand(65..90), rand(97..122), rand(49..57)].sample.chr }.join }
# define_method(:generate) { |n = 'hi'|  }

loop do
	puts <<~'EOF'
		1. Generate Random Password and Check on pwnedpasswords.
		2. Check a Password on pwnedpasswords.
		3. Generate a Random Password without Checking Online.
		4. Generate SHA1 of a Password.
		5. Quit.
	EOF

	c = STDIN.getch
	exit! 0 if c == "\r" || c == "\u0003"

	case c.to_i
		when 1
			begin
				puts "Generated: #{pass = generate}"
				puts "\n\nChecking for leaks on pwnedpasswords."
				count = pwnedpasswords(generate)

				if count > 0
 					puts "#{pass} has been leaked #{c = pwnedpasswords(generate)} times."
					throw :unsafe!
				else
					puts "\n#{pass} is safe to use\n\n\n"
				end

			rescue UncaughtThrowError
				puts "\n\nRegenerating a new password!"
				sleep 2
				retry
			end
		when 2
			print 'Type a Password: '
			puts "#{p = STDIN.gets.strip} has been leaked #{pwnedpasswords(p)} times"
		when 3
			puts "\n#{generate}\n\n"
		when 4
			print 'Type a Password: '
			puts "SHA1: #{sha1(STDIN.gets.strip)}\n\n"
		when 5
			exit! 0
		else
			puts "Invalid input #{c}"
	end

end
