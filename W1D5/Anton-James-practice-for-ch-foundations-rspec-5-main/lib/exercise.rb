require "byebug"

def zip(*arr)
    result = []

    j = 0
    while j < arr[0].length
        i = 0
        block = []
        while i < arr.length
            block << arr[i][j]
        i+=1
        end
        result << block
        j+=1
    end
    
    result
end
#===============================================================
def prizz_proc(arr, prc1, prc2)
    result = []

    arr.each do |ele| 
        result << ele if (prc1[ele] == true || prc2[ele] == true) && !(prc1[ele] == true && prc2[ele] == true)
    end

    result
end
#===============================================================
def zany_zip(*matrix)
    max_length = def_length(matrix)
    grid = Array.new(max_length) { Array.new(matrix.length) }
    
    j = 0
    while j < max_length 

        i = 0
        while i < matrix.length   
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
#===============================================================
def maximum(arr, &prc)
    return nil if arr.length == 0

    scores = arr.map { |ele| prc[ele] }
    
    looking_idx = max_finder(scores)
    arr[looking_idx]
end

def max_finder(scores) # [4, 3, 4]
    winner = 0 
    idx = 0

    i = 0
    while i < scores.length
        if scores[i] >= winner
            winner = scores[i]
            idx = i
        end
        i+=1
    end

    idx
end
#===============================================================
def my_group_by(arr, &prc)
    result = {}

    arr.each { |ele| result[prc[ele]] = [] }
    arr.each { |ele| result[prc[ele]] << ele }

    result
end
#===============================================================
def max_tie_breaker(arr, prc, &blc)
    return nil if arr.length == 0

    winner_block = blc[arr[0]]
    winner_ele = arr[0]

    arr.each do |ele|
        if blc[ele] > winner_block
            winner_block = blc[ele]
            winner_ele = ele
        elsif blc[ele] == winner_block
            if prc.call(ele) > prc.call(winner_ele)
                winner_block = blc[ele]
                winner_ele = ele
            end
        end
    end
    # debugger
    winner_ele
end
#===============================================================
def silly_syllables(sent)
    words = sent.split 
    new_sent = []

    words.each do |word|
        if vowels_count(word) < 2
            new_sent << word
        else
            new_sent << vowels_remover(word)
        end
    end

    new_sent.join(" ")
end

def vowels_count(word)
    count = 0
    word.each_char { |char| count+= 1 if "aeiouAEIOU".include?(char) }
    count
end

def vowels_remover(word)
    temp_word = ""

    word.each_char.with_index do |char,idx|
        if "aeiouAEIOU".include?(char)
            temp_word = word[idx..-1]
            break
        end
    end

    i = temp_word.length-1
    while i >= 0
        if "aeiouAEIOU".include?(temp_word[i])
            return temp_word[0..i]
        end
        i-=1
    end

end
#===============================================================