#!/usr/bin/ruby -w
# Sun Jul 21 01:52:56 2019
# ruby 2.6.3
# Encoding: UTF-8
# PART 11

# Quiz_Restaurant_Bills
# Let's assume we have 2 restaurants side by side
pearl_restaurant = {options: {breakfast: 500, lunch: 750, evening: 750, dinner: 1250}, discount: {day: 250, all: 750}, coupon: {rubyists: 100}}         # => {:options=>{:breakfast=>500, :lunch=>750, :evening=>750, :dinner=>1250}, :discount=>{:day=>250, :all=>750}, :coupon=>{:rubyists=>100}}
grand_restaurant = {options: {breakfast: 1500, lunch: 2500, evening: 3500, dinner: 5000}, discount: {day: 500, all: 1250}, coupon: {rubyists: 250} }    # => {:options=>{:breakfast=>1500, :lunch=>2500, :evening=>3500, :dinner=>5000}, :discount=>{:day=>500, :all=>1250}, :coupon=>{:rubyists=>250}}

# Say you 3 are going to the restaurants. You two like to go to grand_restaurant, and
# The other three are in pearl_restaurant.
# You all would like to eat all the day there. Now calculate in a hash
# the cost of breakfast, lunch, evening, and dinner.

total = pearl_restaurant.merge(grand_restaurant) { |_, x, y| x.merge(y) { |__, a, b| a * 3 + b * 2 } }                                                  # => {:options=>{:breakfast=>4500, :lunch=>7250, :evening=>9250, :dinner=>13750}, :discount=>{:day=>1750, :all=>4750}, :coupon=>{:rubyists=>800}}
# discount, coupons = total[:discount].values.sum, total[:coupon].values.sum
p total[:options].values.sum - total[:discount].values.sum - total[:coupon].values.sum                                                                  # => 27450
