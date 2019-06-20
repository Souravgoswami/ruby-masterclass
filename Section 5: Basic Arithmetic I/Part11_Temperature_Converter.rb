# PART 11                                                                                
# The formula is (T - 32) * (5 / 9) or (T - 32 * 0.555555)                               
# 1                                                                                      
print('Enter the Celsius: ')                                                             # => nil
puts STDIN.gets.to_i.-(32).*(5 / 9.0).round(2)                                           # => nil
                                                                                         
# 2                                                                                      
print('Enter the Celsius: ')                                                             # => nil
puts ((STDIN.gets.to_i - 32) * (5 / 9.0)).round(2)                                       # => nil
                                                                                         
# 3                                                                                      
print('Enter the Celsius: ')                                                             # => nil
puts STDIN.gets.to_i.then { |i| "#{i}°C = #{((i - 32) * (5 / 9.0)).round(2)}°F" }        # => nil
