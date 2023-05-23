require "byebug"

def range(num1, num2)
    # return [] if num1 > num2
    return [] if num1 == num2

    range(num1, num2-1) + [num2-1]
end

# p range(1, 5)
# p range(1, 2) #=> [1]
# p range(1, 3) #=> [1, 2] result range[1, 2] + num2
# p range(1, 4) #=> [1, 2, 3]
# p range(1, 1)
# p range(2, 1)

def exp1(base, exponent)
    return 1 if exponent == 0
    
    base * exp1(base, exponent - 1)
end

# p exp1(1, 0)
# p exp1(1, 1)
# p exp1(10 , 2)

def exp2(base, exponent)
    return 1 if exponent == 0
    return base if exponent == 1

    if exponent.odd?
        return base * exp2(base, exponent/2) * exp2(base, exponent/2)
    else
        return exp2(base, exponent/2) * exp2(base, exponent/2)
    end
end

# p exp2(1, 0)
# p exp2(1, 1)
# p exp2(10, 2)
# p exp2(2, 3)
# p exp2(2, 5)
# p exp2(4, 4)

def deep_dup(array)
    results = []
    array.each do |ele|
        if !ele.is_a?(Array)
            results << ele
        else
            flatten_arr = deep_dup(ele)
            results << flatten_arr
        end
    end
    results 
end

# p deep_dup([1, 2, 3, [4, 5, 6]])
# p deep_dup(["a", "b", "c", ["d", "e", "f"]])

def iter_fib(n)
    seq = [0, 1]

    while seq.length < n
        seq << seq[-1] + seq[-2]
    end

    seq
end

# p iter_fib(5)
# p iter_fib(2)

def rec_fib(n)
    return [0] if n == 1
    return [0, 1] if n == 2

    seq = rec_fib(n-1)
    seq << seq[-1] + seq[-2]
end

# p rec_fib(7)
# p rec_fib(2)

def bsearch(array, target)
    middle_idx = array.length / 2
    return middle_idx if array[middle_idx] == target 
    return nil if array.length == 1
    
    if array[middle_idx] < target
        # debugger
        return bsearch(array[middle_idx..-1], target) + array[0...middle_idx].length if bsearch(array[middle_idx..-1], target) != nil
    else
        return bsearch(array[0...middle_idx], target)
    end
end

# middle_idx = array.length / 2 => num
# return middle_idx if array[middle_idx] == target

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil


def merge_sort(array)
    return [] if array.length == 0
    return array if array.length == 1
    middle_idx = array.length / 2
    left_part = array[0...middle_idx]
    right_part = array[middle_idx..-1]
    left_sorted = merge_sort(left_part)
    right_sorted = merge_sort(right_part)
    merge(left_sorted, right_sorted)
end

def merge(leftarr, rightarr)
    new_array = []
    until leftarr.empty? || rightarr.empty?
        if leftarr[0] < rightarr[0]
            new_array << leftarr.shift
        else   
            new_array << rightarr.shift
        end
    end
    new_array + leftarr + rightarr
end

# p merge_sort([2, 5, 8, 23, 6, 9])

def subsets(array)
    return array if array.length == 0
    result = []
    i = 0
    while i < array.length
        result << subsets(array[i..-1])
        i += 1
    end
    result
end

p subsets([1, 2, 3])

