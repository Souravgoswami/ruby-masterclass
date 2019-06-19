# PART 6                
p 5.0                   # => 5.0
p 5.1.round             # => 5
p 5.5.round             # => 6
                        
p 5.5.truncate          # => 5
p 5.5.to_i              # => 5
p 5.5.floor             # => 5
                        
p 5.5.ceil              # => 6
p 5.1.ceil              # => 6
                        
p 5.5.next_float        # => 5.500000000000001
p 5.5.prev_float        # => 5.499999999999999
                        
p 0.zero?               # => true
p 1.zero?               # => false
p 0.0.zero?             # => true
p 0.000_1.zero?         # => false
