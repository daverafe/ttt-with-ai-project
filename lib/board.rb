class Board
    attr_accessor :cells
    def initialize
        reset!
    end
    def reset!
        @cells = Array.new(9, " ")
    end
    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end
    def position(input)
        number = input.to_i 
        @cells[number - 1]
    end
    def full?
        @cells.all? do |position|
            position == "X" || position == "O"
        end
    end
    def turn_count
        @cells.count{|token| token == "X" || token == "O"}
    end
    def taken?(input)
        if position(input) == " " || position(input) == "" || position(input) == nil 
            return false
            elsif position(input) == "X" || position(input) == "O"
            return true 
          end 
    end
    def valid_move?(input)
        if input.to_i.between?(1, 9) && !taken?(input)
            return true
          end
    end
    def update(position, player)
        @cells[position.to_i - 1] = player.token 
    end
end