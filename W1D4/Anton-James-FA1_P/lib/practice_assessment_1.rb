# Define your methods here. 
def first_letter_vowel_count(sent)
    count = 0
    sent.split.each { |word| count += 1 if "aeiouAEIOU".include?(word[0]) }
    count
end

def count_true(arr, prc)
    count = 0
    arr.each { |ele| count += 1 if prc.call(ele) == true }
    count
end

def procformation(arr, prc1, prc2, prc3)
    result = []

    arr.each do |ele|
        if prc1.call(ele) == true
            result << prc2.call(ele)
        else
            result << prc3.call(ele)
        end
    end

    result
end

def array_of_array_sum(arr)
    result = 0

    arr.each { |subarr| result += subarr.sum }

    result
end

def selective_reverse(sent)
    words = sent.split
    vowels = "aeiouAEIOU"
    new_sent = []

    words.each do |word|
        if vowels.include?(word[0]) || vowels.include?(word[-1])
            new_sent << word
        else
            new_sent << word.reverse
        end
    end

    new_sent.join(" ")
end

def hash_missing_keys(hash, *arg)
    arg.select { |ele| !hash.has_key?(ele) }
end