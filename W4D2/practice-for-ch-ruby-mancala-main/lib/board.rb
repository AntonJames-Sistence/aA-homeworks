require "byebug"
class Board
  attr_accessor :cups, :name1, :name2

  def initialize(name1, name2)
    @cups = Array.new(14) { Array.new }
    place_stones
    @name1 = name1
    @name2 = name2
    @current_player = name1
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    i = 0
    while i < @cups.length
      4.times do
        @cups[i] << :stone if i != 6 && i != 13
      end
      i+=1
    end
    
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' if start_pos < 0 || start_pos > 13
    raise 'Starting cup is empty' if cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    i = start_pos
    while !@cups[start_pos].empty?
      i = i % 13
      stone = @cups[start_pos].pop
      @cups[i+1] << stone
      i+=1
    end
    render
    next_turn(i)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if @cups[ending_cup_idx].length == 1
      return :switch
    elsif @cups[ending_cup_idx].length > 1
      return ending_cup_idx
    else
      return :prompt
    end
    
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    c1 = 0
    c2 = 0
    @cups[0..5].each { |cup| c1 += cup.length }
    return true if c1 == 0
    @cups[7..12].each { |cup| c2 += cup.length }
    return true if c2 == 0
    false
  end

  def winner
    return :draw if @cups[13].length == @cups[6].length
    if @current_player == name1
      return name1
    else
      return name2
    end
  end 
end

