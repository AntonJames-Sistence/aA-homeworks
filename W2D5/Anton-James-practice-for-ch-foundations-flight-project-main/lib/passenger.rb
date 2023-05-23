require "byebug"

class Passenger
    attr_reader :name

    def initialize(name)
        @name = name
        @flight_numbers = []
    end


    def has_flight?(fl_num)
        return true if @flight_numbers.include?(fl_num.upcase)
        false
    end

    def add_flight(fl_num)
        @flight_numbers << fl_num.upcase if has_flight?(fl_num) == false
    end

end