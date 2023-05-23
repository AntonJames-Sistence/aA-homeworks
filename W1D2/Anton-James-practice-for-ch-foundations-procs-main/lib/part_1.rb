def my_map(arr, &prc)
    result = []
    arr.each { |num| result << prc.call(num) }
    result
end

def my_select(arr, &prc)
    result = []
    arr.each { |ele| result << ele if prc.call(ele) == true }
    result
end

def my_count(arr, &prc)
    counter = 0
    arr.each { |ele| counter += 1 if prc.call(ele) == true }
    counter
end

def my_any?(arr, &prc)
    arr.each { |ele| return true if prc.call(ele) == true }
    false
end

def my_all?(arr, &prc)
    arr.each { |ele| return false if prc.call(ele) != true }
    true
end

def my_none?(arr, &prc)
    arr.each { |ele| return false if prc.call(ele) != false }
    true
end