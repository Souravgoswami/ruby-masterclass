# PART 7                                                                 
# An object that holds true value, can be referred to                    
# as truthy. An object with false or nil value is falsey.                
                                                                         
# We can use the not and ! operators to confirm.                         
# The ! and not operators convert any object to either true              
# or false. If they object is truthy, in other words not nil and         
# false, both ! and not will return false, and if the object are         
# falsey, i.e., holds false or nil values, then ! or not operator        
# will return true...                                                    
                                                                         
p !5        # 5 is truthy                                                # => false
p not(5)                                                                 # => false
                                                                         
p !!5        # 5 is truthy, !5 is false, !!5 is true.                    # => true
p !not(5)                                                                # => true
                                                                         
p !false        # opposite of false is true                              # => true
p not(!false)                                                            # => false
                                                                         
p !!0        # 0 is truthy; !0 is false; !false is true                  # => true
p !!1         # 1 is truthy; !1 is false; !false is true                 # => true
                                                                         
p !!true                                                                 # => true
p !!false                                                                # => false
p !not(nil)                                                              # => false
