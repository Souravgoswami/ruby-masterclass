#!/usr/bin/ruby -w
# We will use while loop because it is the fastest loop in Ruby!
require 'benchmark'

module ArraySorting
	refine Array do
		def bubblesort
			new_arr, array_size = dup, size - 1
			swapped = true
			while swapped do
				i, swapped = 0, false

				while (i < array_size)
					el, next_el = new_arr[i], new_arr[i + 1]
					new_arr[i], new_arr[i + 1], swapped = next_el, el, true if el > next_el
					i += 1
				end
			end
			new_arr
		end

		def bubblesort2
			new_arr = dup
			loop while new_arr.each_cons(2).with_index.any? {  |(x, y), i| new_arr[i],  new_arr[i + 1] = y, x if x > y }
			new_arr
		end

		def mergesort
			return self if size <= 1

			mid = size / 2
			part_a, part_b = slice(0...mid).mergesort, slice(mid..-1).mergesort
			array, offset_a, offset_b = [], 0, 0

 			while offset_a < part_a.size && offset_b < part_b.size
				a, b = part_a[offset_a], part_b[offset_b]

				if a <= b
					array.push(a)
					offset_a += 1
				else
					array.push(b)
					offset_b += 1
				end
			end

			while offset_a < part_a.size
				array.push(part_a[offset_a])
				offset_a += 1
			end

			while offset_b < part_b.size
				array.push(part_b[offset_b])
				offset_b += 1
			end

			array
		end
	end
end

using ArraySorting

array = Array.new(3000, &:itself).sort_by { rand }

Benchmark.benchmark do |b|
	b.report(:bubblesort) { array.bubblesort }
	b.report(:mergesort) { array.mergesort }
	b.report(:sort) { array.sort }
end
