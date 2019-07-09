#!/usr/bin/ruby -w

def select(ary, item)
	i, final_arr = -1, []
	final_arr.push(ary[i]) if ary[i += 1] == item while i < ary.size
	final_arr
end

# Well, just to make the exact method:
Array.define_method(:select2) { |&blk| map { |y| y if blk.call(y) }.compact }

ary = [1, 2, 3, 4, 5, 1, 2, 3]
p ary.select { |x| x == 1 }
p select(ary, 1)
p ary.select2 { |x| x == 1 }

ary.replace(%W(a b c d e #{1} #{true} {3} a r u b y g e m))
p ary.select { |x| x.ord == 97 }
p ary.select2 { |x| x.ord == 97 }

# as we are hardcoding the if in our method, the above is not possible!
p select(ary, 'a')
