require 'pry'

# Good morning! Here's your coding interview problem for today.
#
# This problem was asked by Stripe.
#
# Given an array of integers, find the first missing positive integer in linear time and constant space. In other words, find the lowest positive integer that does not exist in the array. The array can contain duplicates and negative numbers as well.
#
# For example, the input [3, 4, -1, 1] should give 2. The input [1, 2, 0] should give 3.
#
# You can modify the input array in-place.

# [3, 4, -1, 1] = 2
# sort from low to high: [-1, 1, 3, 4]

# iterate over array - if i+1 element has a differce of more than plus one - break

array = (1..10000000).to_a


def lowest_positive_integer(array)
  # SORT THE ARRAY FROM LOW TO HIGH
  array = array.sort
  array.each_with_index do |v,i|
    if !array[i+1]
      return v + 1
    elsif (v > 0) && (array[i+1] - v > 1)
      return v +1
    end
  end
end

start = Time.now
p lowest_positive_integer(array)
finish = Time.now
p (finish - start).round(4)

# [1, 2, 0] = 3
