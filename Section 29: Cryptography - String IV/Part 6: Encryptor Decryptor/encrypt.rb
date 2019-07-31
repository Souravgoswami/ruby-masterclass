#!/usr/bin/ruby -w
require 'openssl'

j = ->(file) { File.join(__dir__, file) }
cipher = OpenSSL::Cipher.new('AES-128-CBC').encrypt

Dir[j.('*')].-([j.(File.basename($0)), j.('decrypt.rb')]).each do |f|
	key = 16.times.map { rand(97..122).chr }.join
	cipher.key = key

	puts "Encrypting #{f}"
	File.write(f, cipher.update(IO.read(f)) << cipher.final << key)
	puts "Encrypted #{f}"
end
