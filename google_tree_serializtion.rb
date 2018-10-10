require 'pry'

# This problem was asked by Google.
#
# Given the root to a binary tree, implement serialize(root), which serializes the tree into a string, and deserialize(s), which deserializes the string back into the tree.
#
# For example, given the following Node class
#
# class Node:
#     def __init__(self, val, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
# The following test should pass:
#
# node = Node('root', Node('left', Node('left.left')), Node('right'))
# assert deserialize(serialize(node)).left.left.val == 'left.left'


def serialize(root, array)
  if root == nil
    array.push('N')
    return
  else
    array.push(root.val)
    serialize(root.left, array)
    serialize(root.right, array)
  end
  array.join(",")
end

def deserialize(array)
  if array[@index] == "N" ||  array[@index] == array.length-1
    @index +=1
    return
  end
  root = Node.new(array[@index])
  @index += 1
  root.left = deserialize(array)
  root.right = deserialize(array)
  root
end


class Node
  attr_reader :val, :left, :right
  attr_writer :val, :left, :right

  def initialize(val, left=nil, right=nil)
    @val = val
    @left = left
    @right = right
  end

end

node1 = Node.new('root', Node.new('l', Node.new('l.l')), Node.new('r'))
array = []
string = serialize(node1, array)
p string
@index = 0
deserialized = deserialize(string.split(','))
p deserialized.left.left.val == "l.l"

#              "root"
#           /          \
#       "l"             "r"
#     /     \         /     \
# "l.l"    "l.r"    "r.l"   "r.r"
