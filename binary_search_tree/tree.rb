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
end
