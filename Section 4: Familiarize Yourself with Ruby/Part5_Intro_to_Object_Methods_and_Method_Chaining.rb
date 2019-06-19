# Everything in Ruby is an object.                                                
# String, Float, Integer, Complex, Array, Hash                                    
# And everything you can use of is an object!                                     
# Remember we wrote p 5.class in the beginning?                                   
# Well, 5 is integer and class a method available on any Integer.                 
# So, object methods are methods that are available on an object.                 
a = 5                                                                             # => 5
p a.class                                                                         # => Integer
                                                                                  
# Let us see all the available methods!                                           
p a.methods.sort                                                                  # => [:!, :!=, :!~, :%, :&, :*, :**, :+, :+@, :-, :-@, :/, :<, :<<, :<=, :<=>, :==, :===, :=~, :>, :>=, :>>, :[], :^, :__id__, :__send__, :abs, :abs2, :allbits?, :angle, :anybits?, :arg, :between?, :bit_length, :ceil, :chr, :clamp, :class, :clone, :coerce, :conj, :conjugate, :define_singleton_method, :denominator, :digits, :display, :div, :divmod, :downto, :dup, :enum_for, :eql?, :equal?, :even?, :extend, :fdiv, :finite?, :floor, :freeze, :frozen?, :gcd, :gcdlcm, :hash, :i, :imag, :imaginary, :infinite?, :inspect, :instance_eval, :instance_exec, :instance_of?, :instance_variable_defined?, :instance_variable_get, :instance_variable_set, :instance_variables, :integer?, :is_a?, :itself, :kind_of?, :lcm, :magnitude, :method, :methods, :modulo, :negative?, :next, :nil?, :nobits?, :nonzero?, :numerator, :object_id, :odd?, :ord, :p, :phase, :polar, :positive?, :pow, :pred, :private_methods, :protected_methods, :public_method, :public_methods, :public_send, :quo, :rationalize, :real, :real?, :rect, :rectangular, :remainder, :remove_instance_variable, :respond_to?, :round, :send, :singleton_class, :singleton_method, :singleton_method_added, :singleton_methods, :size, :step, :succ, :taint, :tainted?, :tap, :then, :times, :to_c, :to_enum, :to_f, :to_i, :to_int, :to_r, :to_s, :truncate, :trust, :untaint, :untrust, :untrusted?, :upto, :yield_self, :zero?, :|, :~]
                                                                                  
# Let us use one!!                                                                
p a.odd?                                                                          # => true
p 5.odd?                                                                          # => true
p 6.odd?                                                                          # => false
p 6.even?                                                                         # => true
                                                                                  
# Look at the list, Integer responds to + method!                                 
# Well, +, -, *, %, / are not really operators then! Are they?                    
# Everything in Ruby is a object, and every call is a method call.                
# Except some keywords like def, next, if, in, for, retry, redo, begin etc.       
p 5                                                                               # => 5
p 5 + 5                                                                           # => 10
# Ok so the above is called syntactical sugar or syntactic shorthand!             
                                                                                  
p 5.+(5)                                                                          # => 10
# And the above one is the expanded syntax!                                       
                                                                                  
p 5 * 5                                                                           # => 25
p 5.*(5)                                                                          # => 25
                                                                                  
# In Ruby, you can omit braces while calling a method                             
# That is why we are doing with the Kernel.p method!                              
p 5.* 5                                                                           # => 25
                                                                                  
# Itself returns the current object                                               
# just let us check if we can method chain or not!                                
p 5./ 2.0.itself                                                                  # => 2.5
p 5./ 2.0.* 10                                                                    # => 0.25
p 5./(2.0).*(10)                                                                  # => 25.0
p (5./ 2.0).* 10                                                                  # => 25.0
# So we should not omit braces while method chaining!                             
