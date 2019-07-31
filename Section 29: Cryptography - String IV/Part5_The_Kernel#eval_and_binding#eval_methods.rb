#!/usr/bin/ruby -w
# Encoding: UTF-8
# Sun Jul 21 05:17:32 2019
# ruby 2.6.3
# PART 4

# The kernel#eval can evaluate a string as a piece of Ruby code:
code = STDIN.gets.to_s.strip.then { |x| x.empty? ? "puts('hello world')" : x }
puts Kernel.eval(code)

p Kernel.eval('A = 5')
p Kernel.eval('A')
p Kernel.eval('a = 5')
# p Kernel.eval('a')    # NameError. You should use binding here!

p binding.eval('B = 5')
p binding.eval('B')

# You can assign an object to binding:
__b__ = binding
p __b__.eval('a = 5')
p __b__.eval('a')

puts '-' * 10

# Let's define instance variables from a to z with the power of two's
(?a..?z).each_with_index { |v, i| Kernel.binding.eval("@#{v} = 2 ** i") }
p @a
p @b
p @c
p @d
# Let's print all the variables
p (?a..?z).map { |v| eval("@#{v}") }

# Now eval is slower than interpreting a code.
# You can use it for many tasks.
# Say we have a file:

filename = File.join(__dir__, 'not_a_ruby_source_file')
File.write(filename, %q(1 / 2.0 <%> 2 / 3 <%> 5 * 4 <%> puts('hi') <%> `whoami` <%> `# p :hi` <%> p 'Yes you can do `rm -rf`, so be careful')) #unless File.exist?(filename)
# And we split -- and eval each line
STDERR.puts "Evaluating"
puts File.read(filename).tap(&:display).split('<%>').map { |x| "#{x}    #=> #{Kernel.eval(x)}" }
