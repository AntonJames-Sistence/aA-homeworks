def my_reject(arr, &prc)
    # arr.select { |ele| prc.call(ele) != true }
    result = []
    arr.each { |ele| result << ele if prc.call(ele) != true }
    result
end

def my_one?(arr, &prc)
    count = 0
    arr.each { |ele| count += 1 if prc.call(ele) == true }
    count == 1 ? true : false
end

def hash_select(hash, &prc)
    # hash.reject { |k, v| prc.call(k, v) == false }

    result = {}
    hash.each { |k, v| result[k] = v if prc.call(k, v) == true }
    result
end

def xor_select(arr, prc1, prc2)
    arr.select { |ele| (prc1.call(ele) == true || prc2.call(ele) == true) && !(prc1.call(ele) == true && prc2.call(ele) == true) }
end

def proc_count(val, arr)
    count = 0
    arr.map { |prc| count+=1 if prc.call(val) == true }
    count
end