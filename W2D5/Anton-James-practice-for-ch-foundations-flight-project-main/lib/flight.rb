require "byebug"

class Flight
    attr_reader :passengers

    def initialize(number, capacity)
        @flight_number = number
        @capacity = capacity
        @passengers = []
    end

    def full?
        return true if @passengers.length >= @capacity
        false
    end

    def board_passenger(passenger)
        # debugger
        if !full? && passenger.has_flight?(@flight_number)
            @passengers << passenger
        end

    end

    def list_passengers
        @passengers.map { |pas| pas.name }
    end

    def [](idx)
        @passengers[idx]
    end

    def <<(pass)
        board_passenger(pass)
    end

end