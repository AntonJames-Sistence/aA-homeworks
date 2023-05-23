def palindrome?(str)
    reversed = ""

    str.each_char { |char| reversed = char + reversed }
        
    return true if str == reversed
    false
end

def substrings(str)
    result = []
    
    i = 0
    while i < str.length
        j = 0
        while j < str.length
            result << str[i..j] if j >= i
            j += 1
        end
        i+=1
    end

    return result
end

def palindrome_substrings(string)
    substrings(string).select { |ele| ele.length > 1 && palindrome?(ele) }
end

# def modifier(str)
#     temp = []
    
#     i = 0
#     j = 0
#     while i < str.length # 3 < 3
#         temp_str = ""
#         str = str[j..str.length-1] # j = 2

#         str.each_char do |char|
#             temp_str << char
#             temp << temp_str
#         end

#         i += 1
#         j += 1
#     end

#     return temp
# end

