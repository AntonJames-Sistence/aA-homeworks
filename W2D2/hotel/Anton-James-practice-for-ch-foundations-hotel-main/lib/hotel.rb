require_relative "room"
require "byebug"

class Hotel

    attr_reader :rooms

    def initialize(name, rooms)
        @name = name
        @rooms = Hash.new #{ |hash, key| hash[room_name] = room_capacity  }
        rooms.each do |room_name, cap|
            @rooms[room_name] = Room.new(cap)
        end
    end

    def name
        words = @name.split
        capitalized = []

        words.each { |word| capitalized << word[0].upcase + word[1..-1].downcase }

        capitalized.join(" ")
    end

    def room_exists?(room_name)
        if rooms.keys.include?(room_name)
            return true
        else
            return false
        end
    end

    def check_in(person, room_name)
        # debugger
        exist = room_exists?(room_name)
            
        if exist
            if @rooms[room_name].add_occupant(person)
                print "check in successful"
            else
                print "sorry room is full"
            end
        else
            print "sorry, room does not exists"
        end

    end
    
    def has_vacancy?

        sum = 0
       
        @rooms.each do |key, val|
            sum += @rooms[key].available_space
        end
        
        return true if sum != 0
        false

    end

    def list_rooms
        @rooms.each do |room_name, cap_oc|
            space_av = @rooms[room_name].available_space
            puts room_name +": "+ space_av.to_s
        end
    end

end