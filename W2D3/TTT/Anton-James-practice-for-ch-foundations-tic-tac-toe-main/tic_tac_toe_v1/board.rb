class Board

    def initialize
        @grid = Array.new(3) { Array.new(3) {"_"} }
    end

    def [](position)    #help to utilize ruby shortcuts
        @grid[position[0]][position[-1]]
    end


    def valid?(position)
        return false if position[0] > 2 || position[0] < 0 || position[-1] > 2 || position[-1] < 0
        true
    end

    def empty?(position)
        return false if @grid[position[0]][position[-1]] != "_"
        true
    end

    def place_mark(position, mark)
        if !self.valid?(position) || !self.empty?(position)
            raise "Invalid mark"
        else
            @grid[position[0]][position[-1]] = mark
        end
    end

    def print
        @grid.each do |row|
            joined = row.join(" ")
            puts joined
        end
    end

    def win_row?(mark)
        row = 0
        while row < 3
            i = 0
            win_count = 0
            while i < 3
                win_count += 1 if @grid[row][i] == mark
                i+=1
            end
            return true if win_count == 3
            row+=1
        end
        false
    end

    def win_col?(mark)
        row = 0
        while row < 3
            i = 0
            win_count = 0
            while i < 3
                win_count += 1 if @grid[i][row] == mark
                i+=1
            end
            return true if win_count == 3
            row+=1
        end
        false
    end

    def win_diagonal?(mark)
        if @grid[0][0] == mark && @grid[1][1] == mark && @grid[2][2] == mark
            return true
        end
        if @grid[0][2] == mark && @grid[1][1] == mark && @grid[2][0] == mark
            return true
        end
        false
    end

    def win?(mark)
        if win_col?(mark) || win_row?(mark) || win_diagonal?(mark)
            return true
        end
        false
    end

    def empty_positions?
        counter = 0
        @grid.each do |row|
            row.each { |ele| counter += 1 if ele == "_" }
        end
        return true if counter != 0
        false
    end
end