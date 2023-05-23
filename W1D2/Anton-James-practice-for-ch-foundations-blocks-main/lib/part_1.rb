def select_even_nums(arr)
    arr.select { |num| num % 2 == 0 }
end

def reject_puppies(dogs)
    dogs.reject { |dog| dog["age"] < 3 }
end

def count_positive_subarrays(arr)
    arr.count { |subarr| subarr.sum > 0 }
end

def aba_translate(word)
    translated = ""
    word.each_char do |char|
        if "aeiouAEIOU".include?(char)
            translated += char + "b" + char
        else
            translated += char
        end
    end
    translated
end

def aba_array(words)
    words.map { |word| aba_translate(word) }
end