require_relative "board"
require_relative "human_player"

class Game

    def initialize(player_1_mark, player_2_mark)
        @player_1 = HumanPlayer.new(player_1_mark)
        @player_2 = HumanPlayer.new(player_2_mark)
        @board = Board.new
        @current_player = @player_1
    end

    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
    end

    def play
        until @board.empty_positions? == false
            @board.print
            position = @current_player.get_position
            mark = @current_player.mark
            @board.place_mark(position, mark)
            if @board.win?(mark)
                if @current_player == @player_1
                    puts "Player 1 has won"
                else
                    puts "Player 2 wins"
                end
                break
            else
                switch_turn
            end
        end
        puts "It's a draw" # need to comeback to the problem of printing draw even if player has won
    end
end