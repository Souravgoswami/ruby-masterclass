#!/usr/bin/ruby -w
# PART 9

# The ternary operator can replace 1 line if ... else ... end block!
# Syntax:
#	test-expression ? if-true-expression : if-false-expression

puts (
	if true
		true
	else
		false
	end
)
puts '-' * 5

puts true ? 'true' : 'false'
puts false ? 'true' : 'false'

puts '-' * 5

a = 'hello world'
puts a ? a : 'bye world'

puts '-' * 5

a = nil
puts a ? a : 'bye world'


define_method(:lights_on) { 'Lights On!' }    # if you are using Raspberry pi, you can use rpi_gpio to turn lights on and off!
define_method(:lights_off) { 'Lights Off!' }

loop while (puts(Time.new.strftime('%H').to_i > 16 ? lights_on : lights_off) || Kernel.sleep(1))
