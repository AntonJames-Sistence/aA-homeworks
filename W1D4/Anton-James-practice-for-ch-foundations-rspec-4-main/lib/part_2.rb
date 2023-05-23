def proper_factors(num)
    (1...num).select { |ele| num % ele == 0 }
end

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number?(num)
    aliquot_sum(num) == num ? true : false
end

def ideal_numbers(n)
    sequency = []

    i = 1
    while sequency.length < n
        sequency << i if perfect_number?(i)
        i+=1
    end

    sequency
end