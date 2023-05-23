def all_words_capitalized?(array)
    array.all? { |word| word.capitalize == word }
end

def no_valid_url?(arr)
    arr.none? { |ele|  ele.end_with?(".com", ".net", ".io", ".org") }
end

def avg(arr)
    arr.sum / arr.length
end

def any_passing_students?(students)
    students.any? do |student|
        avg(student[:grades]) >= 75
    end
end
