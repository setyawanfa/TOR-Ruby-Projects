class Board

    attr_accessor :positions

    def initialize
        @positions = [" "," "," "," "," "," "," "," "," "]   
    end

    def showBoard()
        puts " #{positions[0]} | #{positions[1]} | #{positions[2]} "
        puts "---|---|---"
        puts " #{positions[3]} | #{positions[4]} | #{positions[5]} "
        puts "---|---|---"
        puts " #{positions[6]} | #{positions[7]} | #{positions[8]} "   
    end

    def possibleMoves()
        positions.map.with_index  { |val,idx| idx if val == " "}.compact
    end

    def fullboard?
        possibleMoves == []
    end

end