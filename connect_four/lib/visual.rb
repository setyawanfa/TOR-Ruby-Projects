# frozen_string_literal:true

# Visual used to visualed the current stage of connect four game
module Visual

  # tranpose then reverse to show the current 
  def display_board(grid)
    transposed = grid.tranpose.reverse
    transposed.each do |el|
      p '|'
      el.each do |elem|
        p "#{elem} |" 
      end 
      p '\n'
    end 
    p '----------------'
  end
end
