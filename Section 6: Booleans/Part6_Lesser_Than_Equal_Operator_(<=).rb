# PART 6                                             
# The less than equal operator                       
# returns true if the argument is                    
# smaller than or equal to the self object.          
p 5 <= 5                                             # => true
                                                     
# It's like:                                         
p STDIN.gets.to_i.then { |a| a < 5 || a == 5 }       # => false
                                                     
# We are checking if 5 is greater than               
# or equal to 5. That means if the argument          
# is 5 or more than 5, >= method will return true    
