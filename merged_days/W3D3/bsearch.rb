require "byebug"
class Array

    def bsearch(target)
        m_idx = self.length / 2
        return m_idx if self[m_idx] == target
        return nil if self.empty?

        left_part = self[0...m_idx]
        right_part = self[m_idx+1..-1]
        # debugger
        if target < self[m_idx]
            return left_part.bsearch(target)
        else
            if right_part.bsearch(target) == nil
                return nil
            else
                return right_part.bsearch(target) + left_part.length + 1
            end
        end

    end

end


p [1, 2, 3, 4, 5, 6, 7].bsearch(4)
p [1, 2, 3, 4, 5, 6, 7].bsearch(1)
p [1, 2, 3, 4, 5, 6, 7].bsearch(6)
p [1, 2, 3, 4, 5, 6, 7].bsearch(88)
p [1, 2, 3, 4, 5, 6, 7].bsearch(3)
