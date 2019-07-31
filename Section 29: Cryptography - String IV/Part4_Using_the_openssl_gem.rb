#!/usr/bin/ruby -w
# Encoding: UTF-8
# Sun Jul 21 05:17:32 2019
# ruby 2.6.3
# PART 3

# The openssl gem can be used to use OpenSSL module.
# Let's see what it can do:
require 'openssl'

p OpenSSL.class
p OpenSSL::Digest.class

# It also loads the Digest class (not the module)
p OpenSSL::Digest::SHA1.new.digest 'hello'

# Another way to encrypt and decrypt:
message = 'Hello world'
cipher = OpenSSL::Cipher.new('AES-128-CBC')
cipher.encrypt    # Or we can also method chain because encrypt returns the self object
pass = cipher.key = 16.times.map { rand(97..122).chr }.join
message.replace(cipher.update(message) << cipher.final << pass)

# Encrypted message with a random password attached at the end
p message

# Le'ts decrypt it:
decipher = OpenSSL::Cipher.new('AES-128-CBC').decrypt    # or .tap(&:decrypt)
head, decipher.key = message[0...-16], message[-16..-1].tap { |x| puts "Detected key #{x.dump}" }
message.replace(decipher.update(head) << decipher.final)

# Now let's do something different:
message = [214, 195, 146, 193, 147, 239, 8, 101, 216, 49, 147, 239, 146, 137, 166, 105,
	187, 202, 228, 238, 128, 19,  190, 49, 131, 99, 82, 229, 91, 19, 146, 99, 107,
	153, 200, 169, 87, 98, 28, 126, 27, 73, 126, 123, 12, 97, 56, 198
]

decipher = OpenSSL::Cipher::AES.new('128-CBC').decrypt
decipher.key = 'its_a_secret_key'    # got to be 16 bytes key
puts decipher.update(message.pack('c*')) << decipher.final
