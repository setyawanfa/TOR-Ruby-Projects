# frozen_string_literal: true

require_relative 'tree'
require 'pry'

tree = Tree.new([10,20,40,50,70,90])
tree.pretty_print
tree.insert(30)
tree.insert(80)
p ("=====================")
tree.pretty_print
p ("=====================")
tree.pretty_print
p ("=====================")
a = tree.find(90)
p tree.find(90)

p tree.level_order

tree.pretty_print

p tree.inorder

p tree.height

p tree.depth(a)

p tree.balanced?

p ("=====================")
tree.rebalance

tree.pretty_print
