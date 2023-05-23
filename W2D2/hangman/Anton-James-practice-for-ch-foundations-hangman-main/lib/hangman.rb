require "byebug"
class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses
  
  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length) {"_"}
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    return true if attempted_chars.include?(char)
    false
  end

  def get_matching_indices(char)
    idxs = []
    @secret_word.each_char.with_index do |c, i|
      if c == char
        idxs << i
      end
    end
    idxs
  end

  def fill_indices(char, i_arr)
    i_arr.each do |i|
      @guess_word[i] = char
    end
  end

  def try_guess(char)
    success = self.already_attempted?(char)
    m_i = self.get_matching_indices(char)
    self.fill_indices(char, m_i)

    if success
      print "That has already been attempted"
      return false
    else
      @attempted_chars << char

      @remaining_incorrect_guesses -= 1 if !@secret_word.include?(char)

      return true
    end

  end

  def ask_user_for_guess
    print "Enter a char:"
    user_input = gets.chomp
    return self.try_guess(user_input)
  end

  def win?
    if @guess_word.join("") == @secret_word
      print "Congrats! You WIN! "
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      print "Whoops, you LOSE"
      return true
    else
      return false
    end
  end

  def game_over?

    if self.win? || self.lose?
      print "Your secret word was: #{@secret_word} "
      return true
    else
      return false
    end
  end

end