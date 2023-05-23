class Bootcamp
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new { |hash, key| hash[key] = [] }
    end

    def name
        return @name
    end

    def slogan
        return @slogan
    end

    def teachers
        return @teachers
    end

    def students
        return @students
    end

    def hire(new_teacher)
        @teachers << new_teacher
    end

    def enroll(new_student)
        if @students.length < @student_capacity
            @students << new_student
            return true
        else
            return false
        end
    end

    def enrolled?(student)
        if @students.include?(student)
            return true
        else
            return false
        end
    end

    def student_to_teacher_ratio
        return @students.length / @teachers.length
    end

    def add_grade(student, grade)
        if enrolled?(student)
            @grades[student] << grade
            return true
        else
            return false
        end
    end

    def num_grades(student)
        return @grades[student].length
    end

    def average_grade(student)
        if @grades[student].length > 0
            return @grades[student].sum / @grades[student].length
        else
            return nil
        end
    end

end