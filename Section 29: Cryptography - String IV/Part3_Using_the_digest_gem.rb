#!/usr/bin/ruby -w
# Encoding: UTF-8
# Sun Jul 21 05:17:32 2019
# ruby 2.6.3
# PART 2

# The digest gem has many algorithms implemented.
# We first have to require it:
require 'digest'

p Digest::SHA1.new.digest(?a)
p Digest::SHA1.new.digest ?a

p Digest::SHA2.new.digest ?a

p Digest::SHA256.new.digest ?a

# Compute digest by chunks
message = 'This is a secret'
md5 = Digest::MD5.new
md5.update(message)
p md5.hexdigest

md5 << message
p md5.hexdigest

# But this isn't meant to revert back the encryption.
# For example., let's assume we have a hash
# and if the user enters 1234 the access will be granted:
Object.prepend(Digest)
hash = "\x03\xACgB\x16\xF3\xE1\\v\x1E\xE1\xA5\xE2U\xF0g\x956#\xC8\xB3\x88\xB4E\x9E\x13\xF9x\xD7\xC8F\xF4".bytes
loop until print('Password: ') || SHA256.new.digest(STDIN.gets.to_s.strip).bytes == hash.bytes
puts 'Access Granted'
