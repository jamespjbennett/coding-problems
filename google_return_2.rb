# This problem was recently asked by Google.
#
# Given a list of numbers and a number k, return whether any two numbers from the list add up to k.
#
# For example, given [10, 15, 3, 7] and k of 17, return true since 10 + 7 is 17.
#
# Bonus: Can you do this in one pass?

require 'pry'
require 'set'

def find_sum_with_hash(given_array, target_value)
  hash_store = {}
  # ASSIGN EACH ARRAY VALUE INTO THE HASH, WHERE K == VALUE AND V == INDEX
  given_array.each_with_index{|v,i| hash_store[v] = i}
  # LOOP THROUGH ARRAY AGAIN - IF THERE IS A HASH OBJECT KEY THAT MATCHES TARGET VALUE MINUS ITERATED ARRAY VALUE - WE HAVE A MATCH
  given_array.each_with_index do |v,i|
    # if there exists a key in the hash that adds to  the array iteration and equals target_value
    # find this out by minusing the array iteration from the target value
    return true if hash_store[target_value - given_array[i]]
  end
end

  # [1, 2,3,4]
  # 7
  # {6, 5, 4, }


  # [4, 1, 2, 3]
  # 7
  # {3, 6, 5, }
def find_sum_with_compliment_set(given_array, target_value)
  complements = [].to_set
  given_array.each do |val|
    if complements.include?(val)
      return true
    else
      complements.add(target_value - val)
    end
  end
end

def find_sum_with_combination_iteration(given_array, target_value)
  match =  given_array.combination(2).select{|x| x.reduce(:+) == target_value}.flatten.any?
  return match
end



a = (1..100000000).to_a
k = a.max

# EXAMPLE USING SMALER NUMBERS:
# a = [5, 2, 3, 8]
# # HASH is {5:0, 2:1, 3: 2, 8:3}
# k = 13
# # iteration hits 5 ... 13-5 = 8 - so we do have a match

# TRY TRADITIONAL ITERATIVE APPROACH - LOOPING THE ARRAY AND FINDING THE COMBINATIONS OF EACH NUMBER:
# start = Time.now
# p find_sum_with_combination_iteration(a, k)
# finish = Time.now
# diff = finish - start
# puts diff.round(4)

# TAKE 6.8639 SECONDS FOR 10000 RESULTS
# THAT IS MASSIVELY INEFFICIENT. TAKES AN O(n2) APPROACH


# TRY  APPROACH WITH HASH MAPPING - WAY MORE EFFICIENT.
start = Time.now
# find_sum_with_hash(a, k)
finish = Time.now
diff = finish - start
puts diff.round(4)

# TAKE 0.0018 SECONDS FOR 10000 RESULTS
# TAKE 0.0186 SECONDS FOR 100000 RESULTS
# TAKE 0.2194 SECONDS FOR 1000000 RESULTS
# TAKE 3.5 SECONDS FOR 10000000 RESULTS

# TRY  APPROACH WITH SETS- WAY MORE EFFICIENT.
start = Time.now
find_sum_with_compliment_set(a, k)
finish = Time.now
diff = finish - start
puts diff.round(4)

# TAKE 0.0002 SECONDS FOR 1000 RESULTS
# TAKE 0.001 SECONDS FOR 10000 RESULTS
# TAKE 0.0099 SECONDS FOR 100000 RESULTS
# TAKE 0.1421 SECONDS FOR 1000000 RESULTS
# TAKE 2.2945 SECONDS FOR 10000000 RESULTS
# TAKE 30.4977 SECONDS FOR 100000000 RESULTS
