# frozen_string_literal: true

require 'pry'
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

  def delete(value, root = @root)
    if value < root.data
      root.left = delete(value, root.left)
    elsif value > root.data
      root.right = delete(value, root.right)
    else
      return nil if root.right.nil? && root.left.nil?
      return root.right if root.left.nil?
      return root.left if root.right.nil?

      node = root
      leaf = root.right
      until leaf.left.nil?
        node = leaf
        leaf = leaf.left
      end
      if node.data != root.data
        node.left = leaf.right
      else
        node.right = leaf.right
      end
      root.data = leaf.data
    end
    root
  end

  def find(value, root = @root)
    if value < root.data
      find(value, root.left)
    elsif value > root.data
      find(value, root.right)
    else
      return nil if root.data.nil?
      return root if root.data == value
    end
  end
  
  def level_order(root = @root)
    q = [root]
    result = []
    while q.any?
      current = q.shift
      result << current.data
      q << current.left unless current.left.nil?
      q << current.right unless current.right.nil?
    end
    return result
  end

  def inorder(root = @root, arr = [])
    return if root.nil?

    inorder(root.left, arr) unless root.left.nil?
    arr << root.data
    inorder(root.right, arr) unless root.right.nil?
    arr
  end

  def preorder(root = @root, arr = [])
    arr << root.data
    preorder(root.left, arr) unless root.left.nil?
    preorder(root.right, arr) unless root.right.nil?
    arr
  end

  def postorder(root = @root, arr = [])
    postorder(root.left, arr) unless root.left.nil?
    postorder(root.right, arr) unless root.right.nil?
    arr << root.data
    arr
  end

  def height(node = @root)
    return 0 if node.nil?

    (height(node.left) + 1) > (height(node.right) + 1) ? height(node.left) + 1 : height(node.right) + 1
  end

  def depth(node = @root)
    count = 0
    current = @root
    until current.data == node.data
      count += 1
      current = current.left if node.data < current.data
      current = current.right if node.data > current.data
    end

    count
  end

  def balanced?(node = @root)
    left = height(node.left)
    right = height(node.right)
    (left - right).between?(-1, 1)
  end

  def rebalance
    array = inorder(@root)
    @root = build_tree(array.sort.uniq)
  end
end
