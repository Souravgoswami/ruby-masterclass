# PART 11                                                         
# The formula is (T - 32) * (5 / 9) or (T - 32 * 0.555555)        
p (STDIN.gets.to_i - 32 * (5 / 9.0)).round(2)                     # => 82.22
p STDIN.gets.to_i.-(32).*(5 / 9.0).round(2)                       # => 37.78
