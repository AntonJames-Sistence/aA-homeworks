class HumanPlayer
    def initialize(mark)
        @mark = mark
    end

    def mark
        @mark
    end

    def get_position
        puts "Player #{@mark} turn"
        puts "please enter your position following row col like '1 3' where 1 <- row and 3 <- col"
        raw_input = gets.chomp
        nums = "012" #"3456789" limited because of V1.0
        row = raw_input[0]
        col = raw_input[-1]
        if !nums.include?(row) || !nums.include?(col) || raw_input.length > 3
            raise "Not valid numbers"
        else
            return [row.to_i, col.to_i]
        end

    end
end