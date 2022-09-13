# frozen_string_literal: true

require_relative 'node'
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

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def insert(value, root = @root)
    return nil if value == root.data

    if value > root.data
      root.right.nil? ? root.right = Node.new(value) : insert(value, root.right)
    else
      root.left.nil? ? root.left = Node.new(value) : insert(value, root.left)
    end
    root
  end

  def succession(root)
    tree = root
    leaf = root.right
    until leaf.left.nil?
      tree = leaf
      leaf = leaf.left
    end
    if tree.value != root.value
      tree.left = leaf.right
    else
      tree.right = leaf.right
    end
    root.data = leaf.data
    return root
  end

  def delete_scheme(root)
    if root.left.nil?
      temp = root.right
      root.data = nil
    elsif root.right.nil?
      temp = root.left
      root.data = nil
    else
      temp = succession(root)
    end
    return temp
  end

  def delete(value, root = @root)
    return nil if value == root.data

    if value < root.data
      root.left = delete(value, root.left)
    elsif value > root.data
      root.right = delete(value, root.right)
    else
      root = delete_scheme(root)
    end
    root
  end
end
