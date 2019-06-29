#!/usr/bin/ruby -w
# PART 1

# The `if` is a keyword in Ruby that will help
# your programs to make decisions based on
# logics.
# For example, open the door if a person is standing
# in front of the door whose face matches to the owner.
# In such case, there's an if, and that's exactly what we need.

# Another example is increase the score by one if the spaceship
# bullet shoots an enemy spaceship, or else if the spaceship bullet
# hits a friend spaceship, reduce the health, or else (if the bullet hits nothing)
# reduce the bullet count in all cases.

# In hacking, it's used a lot. For exmaple, a server will let you log in
# if your hashed password matches the hashed password stored in the server.

# In the above cases, there's no AI, or machine learning or deep learning kind of
# thing. It's all just a basic if ... elsif ... else ... end block!

define_method(:admin) { 'Access Granted' }

print 'Enter a Number: '

if STDIN.gets.to_i.odd?
	puts 'The Number is odd'
else
	puts 'The Number is even'
end

if STDIN.gets.to_i.even? then
	puts 'Hello'
end

if STDIN.gets.to_i.even? then puts 'Hello' end
