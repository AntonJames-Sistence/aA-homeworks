class Room
    
    attr_reader :capacity, :occupants

    def initialize(capacity)
        @capacity = capacity
        @occupants = []
    end

    def full?
        if @occupants.length < @capacity
            return false
        else
            return true
        end
    end

    def available_space
        @capacity - occupants.length
    end

    def add_occupant(person)
        if self.full?
            return false
        else
            @occupants << person
            return true
        end
    end
    
end