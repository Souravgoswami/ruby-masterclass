#!/usr/bin/ruby -w

FILE, LOCAL, ROOT = '', File.join(__dir__, 'shadow'), File.join(?/ 'etc', 'shadow')

unless File.readable?(ROOT)
	if File.exist?(LOCAL) && File.readable?(LOCAL)
		STDOUT.puts("Can't read #{ROOT}.\nUsing #{LOCAL}")
		FILE.replace(LOCAL)
	else
		STDERR.puts "File #{ROOT} can't be read.\nFile #{LOCAL} doesn't exist"
		exit! 127
	end
else
	FILE.replace(ROOT)
end

def main(shadow:, user:)
	pass = IO.readlines(shadow).find { |l| l.start_with?(user) }.split(?$)
	?$.+(pass[1..2].join(?$)).then { |salt| [salt, salt + ?$ + pass[-1].split(?:)[0]] }
end

def range(first: 0, last: 1000, shadow: '/etc/shadow', user: ENV.fetch('USER'))
	salt, hashed_pass = main(shadow: shadow, user: user)

	(first.to_s..last.to_s).each do |x|
		return(x) if  x.crypt(salt).eql?(hashed_pass)
		puts "Tried Upto #{x}" if x.to_i.then { |y| y % 100 == 0 && y != first }
	end
	nil
end

def brute_force(chars:, length:, shadow: '/etc/shadow', user: ENV.fetch('USER'))
	salt, hashed_pass = *main(shadow: shadow, user: user)
	chars.permutation(length).lazy.uniq.each { |p| return(p.join) if p.join.crypt(salt).eql?(hashed_pass) }
end

p range(shadow: FILE)
p brute_force(chars: [1,5,5, ?a, ?z], length: 2, shadow: FILE)
