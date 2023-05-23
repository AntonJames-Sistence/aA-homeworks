# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
    results = []

    (1..num).each do |ele|
        results << ele if num % ele == 0 && prime?(ele)
    end
        
    results[-1]
end

def prime?(num)
    return false if num < 2

    (2...num).each do |n|
        return false if num % n == 0
    end

    true
end

def unique_chars?(string)
    counter = Hash.new(0)

    string.each_char do |char|
        counter[char] += 1
    end

    return false if counter.values.any? { |ele| ele > 1 }

    true
end

def dupe_indices(arr)
    result = Hash.new { |hash, key| hash[key] = [] }

    arr.each_with_index do |ele1, idx1|
        arr.each_with_index do |ele2, idx2|
            if ele1 == ele2 && idx2 > idx1
                result[ele1].push(idx1, idx2).uniq!
            end
        end
    end

    result
end

def ana_array(arr_1, arr_2)

    return false if arr1.length != arr2.length
    
    arr_1.each do |ele1|
        return false if !arr_2.include?(ele1)
    end

    arr_2.each do |ele2|
        return false if !arr_1.include?(ele2)
    end

    true
end