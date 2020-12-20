class Game

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]]


    attr_accessor :board, :player_1, :player_2
    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)  
        @board = board
        @player_1 = player_1
        @player_2 = player_2
    end
    def current_player
        @board.turn_count % 2 == 0 ? @player_1 : @player_2
    end
    def won?
        WIN_COMBINATIONS.each do |win_combination|
            win_index_1 = win_combination[0]
            win_index_2 = win_combination[1]
            win_index_3 = win_combination[2]
          if (@board.cells[win_index_1] == "X" && @board.cells[win_index_2] == "X" && @board.cells[win_index_3] == "X") ||  (@board.cells[win_index_1] == "O" && @board.cells[win_index_2] == "O" && @board.cells[win_index_3] == "O")
                return win_combination
            end
          end 
          false
    end
    def draw?
        if @board.full? && !won?
            return true 
        else
            return false
        end 
    end
    def over?
        if won? || draw? || @board.full?
            return true 
        end 
    end
    def winner
        if won?
            return @board.cells[won?[0]]
        end 
    end
    def turn
        puts "Please enter 1-9:"
        input = current_player.move(@board)
        if @board.valid_move?(input)
            @board.update(input, current_player)
        else
          turn
        end
    end
    def play
        until over?
        turn
      end
      if won?
            winner == "X" || winner == "O" 
            puts "Congratulations #{winner}!" 
        elsif draw?
          puts "Cat's Game!"
      end
    end
end