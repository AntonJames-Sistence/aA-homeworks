def conjunct_select(arr, *prcs)
    result = []

    arr.each do |ele|
        i = 0
        confirmation = 0
        while i < prcs.length  
            confirmation += 1 if prcs[i].call(ele) == true
            i+=1
        end
        result << ele if confirmation == prcs.length
    end

    result
end

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive ) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd ) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten ) # [7]

def convert_pig_latin(sent)
    words = sent.split
    new_sent = []

    words.each { |word| word.length < 3 ? new_sent << word : new_sent << converting(word) }

    new_sent.join(" ")
end

def converting(word)
    vowels = "aeiouAEIOU"

    return word + "yay" if vowels.include?(word[0])

    word.each_char.with_index do |char, idx|
        if vowels.include?(char)
            before_v = word[0...idx]
            after_v = word[idx..-1]
            return after_v + before_v + "ay"
        end
    end

end

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

def reverberate(sent)
    words = sent.split
    new_sent = []

    words.each { |word| word.length < 3 ? new_sent << word : new_sent << translation(word) }

    new_sent.join(" ")
end

def translation(word)
    vowels = "aeiouAEIOU"

    return word * 2 if vowels.include?(word[-1])

    i = word.length-1
    while i >= 0
        return word + word[i..-1] if vowels.include?(word[i])
        i-=1
    end

end

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

def disjunct_select(arr, *prcs)
    result = []

    arr.each do |ele|
        i = 0
        check = 0
        while i < prcs.length
            check+=1 if prcs[i].call(ele) == true
            i+=1
        end
        result << ele if check >= 1
    end

    result
end

# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]

def alternating_vowel(sent)
    words = sent.split
    new_sent = []

    words.each_with_index { |word, idx| idx % 2 == 0 ? new_sent << alt_even(word) : new_sent << alt_odd(word) }
        
    new_sent.join(" ")
end

def alt_odd(word)
    (word)
    
    i = word.length-1
    while i >= 0
        if "aeiouAEIOU".include?(word[i])
            before_v = word[0...i]
            after_v = word[i+1..-1]
            return before_v + after_v
        end
        i-=1
    end

    word 
end

def alt_even(word)
    word.each_char.with_index do |char, idx|
        if "aeiouAEIOU".include?(char)
            before_v = word[0...idx]
            after_v = word[idx+1..-1]
            return before_v + after_v
        end
    end
    
    word
end

# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

def silly_talk(sent)
    words = sent.split
    new_sent = []

    words.each do |word| 
        if "aeiouAEIOU".include?(word[-1])
            new_sent << word + word[-1]
        else
            new_sent << translate(word)
        end
    end

    new_sent.join(" ")
end

def translate(word)
    vowels = "aeiouAEIOU"
    new_word = ""

    word.each_char do |char|
        if vowels.include?(char)
            new_word += char + "b" + char.downcase
        else
            new_word += char
        end
    end

    new_word
end

# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

def compress(str)
    compressed = ""

    j = 0
    while j < str.length
        i = j
        counter = 1
        while str[i] == str[i+1]
            counter += 1
            i += 1
            j += 1
        end
        compressed << str[j] + counter.to_s if counter > 1
        compressed << str[j] if counter == 1

        j += 1
    end

    compressed
end

# p compress('aabbbbc')   # "a2b4c"
# p compress('boot')      # "bo2t"
# p compress('xxxyxxzzzz')# "x3yx2z4"