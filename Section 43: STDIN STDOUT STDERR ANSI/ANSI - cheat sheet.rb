#!/usr/bin/ruby -w
print (0..255).map { |v| "\e[48;5;#{v}m" << v.to_s.ljust(5) << "\e[0m" }.join("")
