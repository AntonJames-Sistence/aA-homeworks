require "byebug"


class Player

    def get_move

        # begin
        #     puts "enter a position with coordinates separated with a space like `4 7`"
            user_input = gets.chomp
            
            # if user_input[0].to_i >= @board.n || user_input[-1].to_i >= @board.n
                
            #     raise "Nope, wrong numbers"
            # end
            [user_input[0].to_i, user_input[-1].to_i]
        # rescue
        #     puts "Please use selected range"
        #     retry
        # end

    end

end