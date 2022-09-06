# frozen_string_literal: true

require_relative 'node'
# LinkedList class
# Initialize using nil head and nil tail
# Index is used to access the index
class LinkedList
  attr_accessor :index

  def initialize
    @head = nil
    @tail = nil
  end

end
