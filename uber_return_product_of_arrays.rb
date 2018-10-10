require 'pry'
# This problem was asked by Uber.
#
# Given an array of integers, return a new array such that each element at index i of the new array is the product of all the numbers in the original array except the one at i.
#
# For example, if our input was [1, 2, 3, 4, 5], the expected output would be [120, 60, 40, 30, 24]. If our input was [3, 2, 1], the expected output would be [2, 3, 6].
#
# Follow-up: what if you can't use division?


#  efficient algorithmic approach..

# what do we have?
 # [1, 2, 3, 4, 5]
# we know the array's length is 5
# total + of array is 15
# total sum of array is 120

# 120/1  120/2 120/3 120/4 120/5
# [120,  60,   40,   30,   24]
# resulting array - smaller the initial array value the larger its correponsindg result.

# start = Time.now
# sum = array.inject(:*)
# finish = Time.now
# p (finish - start).round(4)
# p array.sort.map{|v| sum/v}
# finish = Time.now
# p (finish - start).round(4)

# for 100 results 0.0001
# *38
# for 1000 results 0.0038
# * 111.7
# for 10000 results 0.4248
# for 100000 results this times out -




# ANOTHER APPROACH:

# FIGURED OUT THAT IF YOU SORT THE ARRAY FROM HIGH TO LOW AND DIVIDE CORRESPONDING I OF THE RESULTS - THE RESULTING NUMBER ALWAYS RETURN A COMPLETELY EVEN AND MIRRORED DOWN CURVE.

# sum = array.inject(:*)
# p array.sort.reverse
# mapped =  array.sort.map{|v| sum/v}
# p mapped
#


def product_with_double_iteration(a)
  a.map{|x| (a.select{|n| n!= x}).inject(:*)}
end

def product_with_sum_and_division(a)
  sum = a.inject(:*)
  a = a.sort.reverse
  a.each_with_index.map{|v,i| (v*(sum / (v.to_f*a[a.length-(i+1)])))}
end

array =  (1..1000).to_a
# expected_output = [120 (2*3*4*5), 60, (1*3*4*5), 40 (1*2*4*5), 30(1*2*3*5), 24 (1*2*3*4)]

# Standard ruby. When thuis solution got to 10000 - it timed out. T
start = Time.now
product_with_double_iteration(array)
finish = Time.now
puts (finish - start).round(4)

start = Time.now
product_with_sum_and_division(array)
finish = Time.now
p (finish - start).round(4)
# for 100 results 0.0001
# * 9
# for 1000 results 0.0009
# * 55
# for 10000 results 0.0499
# for 100000 results 4.8036
# for 200000 results 23.1844




















#
