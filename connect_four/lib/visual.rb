# frozen_string_literal:true

# Visual used to visualed the current stage of connect four game
module Visual

  # tranpose then reverse to show the current 
  def display_board(grid)
    transposed = grid.transpose.reverse
    transposed.each do |el|
      el.map! { |x| x ? x : ' ' }
    end
    transposed.each do |el|
      puts '| ' + el.join(' | ') + ' |'
    end 
    puts '-----------------------------'
  end
end
