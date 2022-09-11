# frozen_string_literal: true

# Tree 
class Tree
  def initialize(array)
    @root = build_tree(array.sort.uniq)
  end

  def build_tree(array)
    return if array.empty?
    return Node.new(array[0]) if array.length == 1

    root = Node.new(array[array.length / 2])
    root.left = build_tree(array[0...array.length / 2])
    root.right = build_tree(array[((array.length / 2) + 1)..array.length])
    root
  end
end
