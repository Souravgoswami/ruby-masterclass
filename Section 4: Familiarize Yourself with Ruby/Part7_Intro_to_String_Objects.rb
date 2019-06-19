# Just like Integers, String objects have numerous methods too!                     
# Let us take a basic look for now, we will cover this in more detail               
a = 'Hello'                                                                         # => Hello
p a.class                                                                           # => String
                                                                                    
p a.methods.sort                                                                    # => [:!, :!=, :!~, :%, :*, :+, :+@, :-@, :<, :<<, :<=, :<=>, :==, :===, :=~, :>, :>=, :[], :[]=, :__id__, :__send__, :ascii_only?, :b, :between?, :bytes, :bytesize, :byteslice, :capitalize, :capitalize!, :casecmp, :casecmp?, :center, :chars, :chomp, :chomp!, :chop, :chop!, :chr, :clamp, :class, :clear, :clone, :codepoints, :concat, :count, :crypt, :define_singleton_method, :delete, :delete!, :delete_prefix, :delete_prefix!, :delete_suffix, :delete_suffix!, :display, :downcase, :downcase!, :dump, :dup, :each_byte, :each_char, :each_codepoint, :each_grapheme_cluster, :each_line, :empty?, :encode, :encode!, :encoding, :end_with?, :enum_for, :eql?, :equal?, :extend, :force_encoding, :freeze, :frozen?, :getbyte, :grapheme_clusters, :gsub, :gsub!, :hash, :hex, :include?, :index, :insert, :inspect, :instance_eval, :instance_exec, :instance_of?, :instance_variable_defined?, :instance_variable_get, :instance_variable_set, :instance_variables, :intern, :is_a?, :itself, :kind_of?, :length, :lines, :ljust, :lstrip, :lstrip!, :match, :match?, :method, :methods, :next, :next!, :nil?, :object_id, :oct, :ord, :p, :partition, :prepend, :private_methods, :protected_methods, :public_method, :public_methods, :public_send, :remove_instance_variable, :replace, :respond_to?, :reverse, :reverse!, :rindex, :rjust, :rpartition, :rstrip, :rstrip!, :scan, :scrub, :scrub!, :send, :setbyte, :singleton_class, :singleton_method, :singleton_methods, :size, :slice, :slice!, :split, :squeeze, :squeeze!, :start_with?, :strip, :strip!, :sub, :sub!, :succ, :succ!, :sum, :swapcase, :swapcase!, :taint, :tainted?, :tap, :then, :to_c, :to_enum, :to_f, :to_i, :to_r, :to_s, :to_str, :to_sym, :tr, :tr!, :tr_s, :tr_s!, :trust, :undump, :unicode_normalize, :unicode_normalize!, :unicode_normalized?, :unpack, :unpack1, :untaint, :untrust, :untrusted?, :upcase, :upcase!, :upto, :valid_encoding?, :yield_self]
p 'Hello' + 'World'                                                                 # => HelloWorld
p 'Hello ''World'                                                                   # => Hello World
                                                                                    
# Ok avoid this one, not a python fan :(                                            
p '''Hiee!!'''                                                                      # => Hiee!!
                                                                                    
# Double quote support string interpolation:                                        
p a = 5                                                                             # => 5
p a                                                                                 # => 5
                                                                                    
p "Hello #{a}"                                                                      # => Hello 5
                                                                                    
# Single quote shows literals...                                                    
p 'Hello #{5}'                                                                      # => Hello #{5}
                                                                                    
# Escaping characters:                                                              
p "H\\el\\lo"                                                                       # => H\el\lo
p "Hi#{5}"                                                                          # => Hi5
                                                                                    
# That's it for now! In part 27 we will take a deeper look at string objects,       
# varioius here documents, the %q, %Q syntaxes, and many more methods.),            
