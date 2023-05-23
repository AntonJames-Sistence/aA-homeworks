def hipsterfy(word)
    vowels = "aeiouAEIOU"

    i = word.length-1
    while i >= 0
         if vowels.include?(word[i])
            return word[0...i] + word[i+1..-1]
         end
         i -= 1
    end

    word
end

def vowel_counts(str)
    result = Hash.new(0)

    str.downcase.each_char do |char| 
        result[char] += 1
    end
    

    result
end

def caesar_cipher(str, n)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    ciphered = ""
    
    str.each_char.with_index do |char, idx|
        if alphabet.include?(char)
            old_index = alphabet.index(char)
            new_index = (old_index + n) % 26
            ciphered << alphabet[new_index]
        else
            ciphered << char
        end
    end

    ciphered
end