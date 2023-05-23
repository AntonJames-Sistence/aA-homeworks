class Dog
  def initialize(name, breed, age, bark, favorite_foods)
    @name = name
    @breed = breed
    @age = age
    @bark = bark
    @favorite_foods = favorite_foods
  end

  def name
    @name
  end

  def breed
    @breed
  end

  def age
    @age
  end

  def age= new_age
    @age = new_age
  end

  def bark
    if @age > 3
        return @bark.upcase
    else
        return @bark.downcase
    end
  end

  def favorite_foods
    return @favorite_foods
  end

  def favorite_food?(food)
    fav_food = @favorite_foods.map { |ele| ele.downcase }
    
    if fav_food.include?(food.downcase)
        return true
    else
        return false
    end
  end

end

class Car
  def initialize(name, color)
    @name = name
    @color = color
  end
  return "privet"
end