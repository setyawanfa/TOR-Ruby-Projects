# frozen_string_literal: true

# Node class is used to define value and next node
# initialize as nil
class Node
  attr_accessor :value, :next_node

  def initialize
    @value = nil
    @next_node = nil
  end
end
