#!/usr/bin/ruby -w
# Encoding: UTF-8
require 'openssl'

j = ->(file) { File.join(__dir__, file) }
decipher = OpenSSL::Cipher.new('AES-128-CBC').decrypt

Dir[j.('*')].-([j.(File.basename($0)), j.('encrypt.rb')]).each do |f|
	data = IO.read(f)
	head, key = data[0..-17], data[-16..-1]

	puts "Found key #{key}"
	decipher.key = key

	puts "Decrypting #{f}"
	File.write(f, decipher.update(head) << decipher.final)
	puts "Decrypted #{f}"
end
