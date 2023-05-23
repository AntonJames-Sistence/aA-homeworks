require_relative "board"
require_relative "player"

require "byebug"

class Battleship

    attr_reader :board, :player

    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = (n*n) / 2
    end

    def start_game
        @board.place_random_ships
        # puts @board.size / 4
        puts @board.num_ships
        print @board.print
    end

    def lose?
        if @remaining_misses <= 0
            puts "you lose"
            return true
        end
        false
    end

    def win?
        if @board.num_ships == 0
            puts "you win!"
            return true
        end
        false
    end

    def game_over?
        if self.lose? || self.win?
            return true
        end
        false
    end

    def turn
        # debugger
        target = @player.get_move
        attack_attempt = @board.attack(target)
        puts @board.print

        if attack_attempt != true
            @remaining_misses -= 1
            puts @remaining_misses
        end

    end

end