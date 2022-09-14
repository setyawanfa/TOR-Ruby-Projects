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
tree.delete(20)
p ("=====================")
tree.pretty_print
p ("=====================")
p tree.find(70)
p tree.find(90)
