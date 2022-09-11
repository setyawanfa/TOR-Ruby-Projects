# frozen_string_literal: true

# Node class to define the basic data storage
# Data to store the data with left and right side
class Node
  attr_accessor :data, :left, :right

  def initialize(data = nil, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end
end
