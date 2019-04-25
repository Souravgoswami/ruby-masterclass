5.times { printf 'hi' }
puts

5.times { |i| print "#{i} " }
puts

5.times do |i|
	print "#{i} "
end
puts

5.times { |i| puts '*' * i }
