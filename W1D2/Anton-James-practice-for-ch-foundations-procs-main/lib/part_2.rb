def reverser(str, &prc)
    result = ""
    str.each_char { |char| result = char + result }
    prc.call(result)
end

def word_changer(str, &prc)
    words = str.split
    new_str = []

    words.each { |word| new_str << prc.call(word) }

    new_str.join(" ")
end

def greater_proc_value(num, prc_1, prc_2)
    if prc_1.call(num) > prc_2.call(num)
        return prc_1.call(num)
    else
        return prc_2.call(num)
    end
end

def and_selector(arr, prc1, prc2)
    result = []

    arr.each { |ele| result << ele if prc1.call(ele) == true && prc2.call(ele) == true }

    result
end

def alternating_mapper(arr, prc1, prc2)
    new_arr = []

        arr.each_with_index do |ele, idx|
            if idx % 2 == 0
                new_arr << prc1.call(ele)
            else
                new_arr << prc2.call(ele)
            end
        end

    new_arr
end