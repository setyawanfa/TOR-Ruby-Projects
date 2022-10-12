# frozen_string_literal:true
# Knight class will define the movement of knight object in 'L' ways
class Knight
  attr_accessor :location, :parent

  @@visited = []
  def initialize(location, parent)
    @location = location
    @parent = parent
    @@visited << location
  end

  def self.valid?(location)
    (0..8).include?(location[0]) && (0..8).include?(location[1])
  end

  def children
    dx = [2, 2, -2, -2, 1, 1, -1, -1]
    dy = [1, -1, 1, -1, 2, -2, 2, -2]
    possible = []
    (0...dx.length).each do |i|
      x1 = dx[i] + @location[0]
      y1 = dy[i] + @location[1]
      if Knight.valid?([x1, y1]) && !@@visited.include?([x1, y1])
        possible << Knight.new([x1, y1], self)
      end
    end
    possible
  end

  def display
    self.parent.display unless self.parent.nil?
    p self.location
  end
end

def knight_moves(start, dest)
  queue = []
  current = Knight.new(start, nil)
  until current.location == dest
    current.children.each { |child| queue << child }
    current = queue.shift
  end
  current.display
end
