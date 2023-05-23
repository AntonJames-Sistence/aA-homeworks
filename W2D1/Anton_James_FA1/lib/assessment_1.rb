#===============================================

def my_map!(arr, &blc)
    i = 0
    while i < arr.length
        arr[i] = blc.call(arr[i])
        i+=1
    end
    arr
end

#===============================================

def two?(arr, &blc)
    counter = 0

    arr.each do |ele|
        counter += 1 if blc[ele] == true
    end
    return true if counter == 2
    false
end

#===============================================

def nor_select(arr, prc1, prc2)

    new_arr = arr.select do |ele|
        prc1[ele] == false && prc2[ele] == false
    end

    new_arr
end

#===============================================

def array_of_hash_sum(arr)
    sum = 0
   
    arr.each do |hash|
        hash.each { |k, v| sum += v }
    end

    sum
end

#===============================================

def slangify(sent)
    words = sent.split
    new_sent = []

    words.each { |word| new_sent << remover(word) }

    new_sent.join(" ")
end

def remover(word)

    word.each_char.with_index do |char, idx|
        return word[0...idx] + word[idx+1..-1] if "aeiouAEIOU".include?(char)
    end
    word
end

#===============================================

def char_counter(str, *nums)
    count_all = Hash.new(0)

    str.each_char { |char| count_all[char] += 1 }

    selected = count_all.select { |k, v| nums.include?(k) }

    nums.each do |num|
        if !count_all.keys.include?(num)
            selected[num] = 0
        end
    end

    if nums.length == 0
        return count_all
    else
        return selected
    end
   
end

#===============================================