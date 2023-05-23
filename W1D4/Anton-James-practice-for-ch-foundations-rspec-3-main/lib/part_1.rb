def is_prime?(num)
    return false if num < 2

    (2...num).each { |ele| return false if num % ele == 0 }

    true
end

def nth_prime(number) # 5
    primes = [] # 2, 3, 5, 7, 11

    i = 2 # 8
    while primes.length <= number # 4 <= 5
        primes << i if is_prime?(i) # 7
        i+=1 # i ++
    end

    primes[number-1]
end

def prime_range(min, max)
    (min..max).select { |ele| is_prime?(ele) }
end