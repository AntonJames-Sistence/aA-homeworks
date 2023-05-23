def average(num_1, num_2)
    (num_1 + num_2) / 2.0 
end

def average_array(array)
    array.sum * 1.0 / array.length
end

def repeat(str, num)
    str * num
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(sentence)
    alternated = []

    sentence.split.each_with_index do |word, idx|
        if idx % 2 == 0
            alternated << word.upcase
        else
            alternated << word.downcase
        end
    end

    alternated.join(" ")
end
