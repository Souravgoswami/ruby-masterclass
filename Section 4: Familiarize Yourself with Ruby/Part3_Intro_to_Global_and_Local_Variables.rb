# Local variables can be defined simply, like this:                                 
a, b = 5, 6                                                                         # => [5, 6]
                                                                                    
# The scope of local variables spans across the block                               
# Local variables if defined inside a block, cannot be used outside the block       
1.times { inside_scope_variable = 5 }                                               # => 1
p defined?(inside_scope_variable)                                                   # => 
                                                                                    
# Local variable if defined outside a block, and used inside the block later,       
# will act as a global variable inside block, so changing the value there           
# will also change the value outside:                                               
outside_scope_variable = 6                                                          # => 6
1.times { outside_scope_variable = 2000 }                                           # => 1
p outside_scope_variable                                                            # => 2000
                                                                                    
# Global Variables start with $ sign                                                
$a, $b = 100, 200                                                                   # => [100, 200]
                                                                                    
p local_variables.sort                                                              # => [:__binding__, :__index__, :__max_length__, :__vals__, :a, :b, :c, :codes, :f, :files, :outside_scope_variable]
p local_variables.include?(:a)                                                      # => true
                                                                                    
p global_variables.sort                                                             # => [:$!, :$", :$$, :$&, :$', :$*, :$+, :$,, :$-0, :$-F, :$-I, :$-K, :$-W, :$-a, :$-d, :$-i, :$-l, :$-p, :$-v, :$-w, :$., :$/, :$0, :$:, :$;, :$<, :$=, :$>, :$?, :$@, :$DEBUG, :$FILENAME, :$KCODE, :$LOADED_FEATURES, :$LOAD_PATH, :$PROGRAM_NAME, :$SAFE, :$VERBOSE, :$\, :$_, :$`, :$a, :$b, :$fileutils_rb_have_lchmod, :$fileutils_rb_have_lchown, :$stderr, :$stdin, :$stdout, :$~]
