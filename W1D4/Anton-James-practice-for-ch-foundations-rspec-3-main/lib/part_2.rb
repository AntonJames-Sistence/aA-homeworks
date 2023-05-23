def element_count(arr)
    counter = Hash.new(0)
    arr.each { |ele| counter[ele] += 1 }
    counter
end

def char_replace!(str, hash)
    str.each_char.with_index { |char, idx| str[idx] = hash[char] if hash.key?(char) }
    str
end

def product_inject(arr)
    arr.inject { |base, ele| base * ele }
end