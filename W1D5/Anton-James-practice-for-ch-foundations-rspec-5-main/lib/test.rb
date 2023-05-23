require "byebug"

# # def zip(*arr)
# #     result = []

# #     # debugger
# #     j = 0
# #     while j < arr[0].length
# #         i = 0
# #         block = []
# #         while i < arr.length
# #             block << arr[i][j]
# #         i+=1
# #         end
# #         result << block
# #         j+=1
# #     end
    
# #     result
# # end

# # array_1 = ['a', 'b', 'c'] 
# # array_2 = [1, 2, 3]
# # array_3 = ['w', 'x', 'y']

# # print zip(array_1, array_2, array_3) 

def zany_zip(*matrix)
    max_length = def_length(matrix)
    grid = Array.new(max_length) { Array.new(matrix.length) }
    
    j = 0
    while j < max_length # 0,1,2 < 3
        i = 0
        while i < matrix.length   # 0,1,2 < 3 / 0,1 < 2 / 0,1,2,3,4 < 5
            grid[j][i] = matrix[i][j]

            i+=1
        end

        j+=1
    end 

    grid
end


def def_length(grid)
    length = 0
    grid.each { |ele| length = ele.length if ele.length > length }
    length
end

array_1 = ['a', 'b', 'c']
array_2 = [1, 2, 3]
array_3 = [11, 13, 15, 17]

print zany_zip(array_3, array_2, array_1) 


