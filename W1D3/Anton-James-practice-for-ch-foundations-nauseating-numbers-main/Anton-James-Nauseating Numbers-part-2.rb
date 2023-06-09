def anti_prime?(num)
    (1...num).each { |ele| return false if div_count(ele) > div_count(num) }
    true
end

def div_count(num)
    count = 0

    (1...num).each do |ele|
        count += 1 if num % ele == 0
    end

    count
end

# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false

# def prime_arr(num)
#     primes = []
#     (2...num).each do |ele|
#         primes << ele if prime?(ele)
#     end
#     primes
# end

# def prime?(num)
#     (2...num).each { |ele| return false if num % ele == 0 }
#     true
# end

def matrix_addition(matrix1, matrix2)
    new_matrix = []

    matrix1.each_with_index do |subarr, idx|
        combined = matrix1[idx] + matrix2[idx]
        new_matrix << support(combined)
    end
    
    new_matrix
end

def support(arr)
    result = []

    i = 0
    while i < arr.length-2
        result << arr[i] + arr[i+2]
        i += 1
    end

    result
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]
def mutual_factors(*nums)
    result = []
    matrix = nums.map { |num| divisors(num) }

    matrix[0].each do |checking_ele| # Pick up any arr inside matrix, in this case matrix[0]
        c = 0   # set counter to 0, so we can keep track of arrays that include checking number(element)
        matrix.each do |subarr| # starting loop to get access to every subarr
            subarr.each do |potential_ele|  #one more loop to get to the actual numbers
                if potential_ele == checking_ele # first conditional wich suppose to increment only when you hit same number as you currently checking
                    c += 1
                end
            end
            result << checking_ele if c == matrix.length # by the end if counter == ammount of arrays we created in the beggining it should mean
        end                                             # that we found looking element in every arr, so we can safely add it to our result
    end

    result
end

def divisors(num)
    (1..num).select { |ele| num % ele == 0 }
end

# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]

def tribonacci_number(num)
    tribonacci_sequence = [1, 1, 2]

    num.times do
        start_ele = tribonacci_sequence[-1]
        next_ele = start_ele + tribonacci_sequence[-2] + tribonacci_sequence[-3]
        tribonacci_sequence << next_ele
    end

    tribonacci_sequence[num-1]
end

# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274