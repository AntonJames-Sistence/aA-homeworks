require "byebug"
class Item
    def self.valid_date?(date_string)
        splitted = date_string.split("-")
        
        return false if date_string.length != 10
        
        year = splitted[0].to_i
        month = splitted[1].to_i
        day = splitted[2].to_i

        return false if month > 12 || month < 1
        return false if day > 31 || day < 1

        true
        # debugger
    end

    
end

p Item.valid_date?('2019-10-25') # true
p Item.valid_date?('1912-06-23') # true
p Item.valid_date?('2018-13-20') # false
p Item.valid_date?('2018-12-32') # false
p Item.valid_date?('10-25-2019') # false