# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array

    def span
        if self.length != 0
            return self.max - self.min
        else
            return nil
        end
    end

#===========================================

    def average
        if self.length != 0
            return self.sum / (self.length * 1.0)
        else
            return nil
        end
    end

#===========================================

    def median
        middle = self.length / 2
        if self.length == 0
            return nil
        elsif self.length % 2 == 0 && self.length > 2
            avg = (self[middle] + self[middle+1]) / 2.0
            return avg
        elsif self.length == 2
            return self.sum / 2.0
        else
            return self.sort[middle]
        end
    end

#===========================================

    def counts
        counter = Hash.new(0)
        self.each { |ele| counter[ele] += 1 }
        counter
    end

#================================ PART 2 =========================

    def my_count(val)
        count = 0
        self.each { |ele| count += 1 if ele == val }
        count
    end

    #===========================================

    def my_index(val)
        self.each_with_index do |ele, idx|
            return idx if ele == val
        end
        nil
    end

    #===========================================
    
    def my_uniq
        uniq = []
        self.each do |ele|
            uniq << ele if !uniq.include?(ele)
        end
        uniq
    end

    #===========================================
    
    def my_transpose
        grid = Array.new(self.length) { Array.new(0) }

        j = 0
        while j < self[0].length
            i = 0
            while i < self[0].length
                grid[j][i] = self[i][j]
                i+=1
            end
            j+=1
        end

        grid
    end

end