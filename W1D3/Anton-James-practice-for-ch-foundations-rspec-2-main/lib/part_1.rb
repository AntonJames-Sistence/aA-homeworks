def partition(arr, num)
    result = Array.new(2) { Array.new }

    arr.each { |ele| ele < num ? result[0] << ele : result[1] << ele }

    result
end

def merge(hash_1, hash_2)
    result = {}

    hash_1.each { |key1, val1| result[key1] = val1 }
    hash_2.each { |key2, val2| result[key2] = val2 }

    result
end

def censor(sent, curse)
    words = sent.split
    new_sent = []

    words.each do |word| 
        if curse.include?(word.upcase) || curse.include?(word.downcase)
            new_sent << do_censor(word)
        else
            new_sent << word
        end
    end

    new_sent.join(" ")
end

def do_censor(word)
    new_word = ""

    word.each_char do |char|
        if "aeiouAEIOU".include?(char)
            new_word += "*"
        else
            new_word += char
        end
    end

    new_word
end

def power_of_two?(num)
    return true if num == 1

    (2..num).each do |n|
        if 2**n == num
            return true
        end
    end
    
    false
end