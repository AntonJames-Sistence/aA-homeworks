require "employee"
require "byebug"

class Startup
  
    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        return true if salaries.keys.include?(title)
        false
    end
    # debugger
    def >(another_startup)
        return true if self.funding > another_startup.funding
        false
    end

    def hire(employee_name, title)
        if !valid_title?(title)
            raise "We do not have this title"
        else
            @employees << Employee.new(employee_name, title)
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        if @funding < @salaries[employee.title]  
            raise "Whoops, we're calling for bankrupcy"
        end
        
        ammount = @salaries[employee.title]
        employee.pay(ammount)
        @funding -= @salaries[employee.title]                  
    end

    def payday
        @employees.each do |emp|
            pay_employee(emp)
        end
    end

    def average_salary
        total = 0
        
        @employees.each do |emp|
            total += @salaries[emp.title]
        end

        total / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(another_one)
        @funding += another_one.funding
        
        another_one.salaries.each do |k, v|
            if !@salaries.keys.include?(k)
                @salaries[k] = v
            end
        end
        # debugger
        another_one.employees.each do |emp|
             @employees << emp
        end
        
        another_one.close
    end
    
end