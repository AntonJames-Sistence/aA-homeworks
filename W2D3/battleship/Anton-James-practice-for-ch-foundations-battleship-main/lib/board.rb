class Board

    attr_reader :size

    def initialize(n)
        @n = n
        @grid = Array.new(@n) { Array.new(@n) }
        @grid.each do |subarr|
            subarr.map! { |ele| ele = :N }
        end
        @size = @grid.length * @grid.length
    end

    def [](position_arr)
        @grid[position_arr[0]][position_arr[1]]
    end

    def []=(position_arr, val)
        @grid[position_arr[0]][position_arr[1]] = val
    end

    def num_ships
        ships_num = 0

        @grid.each do |subarr|
            subarr.each { |ele| ships_num += 1 if ele == :S }
        end

        ships_num
    end

    def attack(position)
        try_hit = self.[](position)
        if try_hit == :S
            self.[]=(position, :H)
            puts "you sunk my battleship!"
            return true
        else
            self.[]=(position, :X)
            # puts "whoops, you missed!"
            return false
        end
    end

    def place_random_ships
        already_set = 0
        necessary_ammount = @size / 4
        
        while already_set < necessary_ammount
            random_position = [rand(0...@n), rand(0...@n)]   #using random to assign random arra ex: [1, 3]
            if self.[](random_position) != :S #make sure we do not reassign positions
                self.[]=(random_position, :S)  # assigning position for :Ship
                already_set += 1   #incrementing only in case we did assign
            end
        end
    end

    def hidden_ships_grid
        hidden_map = Array.new(@n) { Array.new(@n) }

        j = 0
        while j < @n
            i = 0
            while i < @n
                if @grid[j][i] == :S || @grid[j][i] == :N
                    hidden_map[j][i] = :N
                else 
                    hidden_map[j][i] = :X
                end
                i+=1
            end
            j+=1
        end

        hidden_map
    end

    # def self.print_grid(grid)
    #     grid.each do |subarr|
    #         subarr.each do |ele|
    #             print "#{ele} "
    #         end
    #         print "\n"
    #     end
    # end

    def self.print_grid(grid)
        j = 0
        while j < grid.length
            i = 0
            while i < grid.length
                if i < grid.length - 1
                    print "#{grid[j][i]} "
                else
                    print "#{grid[j][i]}"
                end
                i+=1
            end
            # if j < grid.length-1
                print "\n"
            # end
            j+=1
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        hidden_grid = self.hidden_ships_grid
        Board.print_grid(hidden_grid)
    end

end