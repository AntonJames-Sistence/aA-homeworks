require "byebug"
# Write a method, all_vowel_pairs, that takes in an array of words and returns
# all pairs of words that contain every vowel. Vowels are the letters a, e, i,
# o, u. A pair should have its two words in the same order as the original
# array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"]) # => ["action europe", "tear impromptu"]

def all_vowel_pairs(words)
  pairs = pairs_creator(words)
  result = []

  pairs.each do |pair|
    result << pair if filter(pair)
  end

  result
end

def pairs_creator(words)

  result = []

  words.each_with_index do |word1, idx1|
    words.each_with_index do |word2, idx2|
      if idx2 > idx1
        result << word1 + " " + word2
      end
    end
  end

  result
end

def filter(str)
  vowels = ["a", "e", "i", "o", "u"]
  counter = 0

  i = 0
  while i < vowels.length
    if str.include?(vowels[i])
      counter += 1
    end
    i+=1
  end

  return true if counter == 5
  false
end

p all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"]) # => ["action europe", "tear impromptu"]

# Write a method, composite?, that takes in a number and returns a boolean
# indicating if the number has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true composite?(13)    # => false
def composite?(num)
  return false if num < 2
  (2...num).each { |ele| return true if num % ele == 0 }
  false
end



# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the order of their appearance in the
# original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    # words = str.split
    bigrams_arr = []

    # words.each do |word|
    #   bigrams.each do |bigram|
    #     bigrams_arr << bigram if word.include?(bigram)
    #   end
    # end

    bigrams.each do |bigram|
      bigrams_arr << bigram if str.include?(bigram)
    end

    bigrams_arr 
end

# p find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# p find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]


# Write a method, Hash#my_select, that takes in an optional proc argument
# The method should return a new hash containing the key-value pairs that return
# true when passed into the proc.
# If no proc is given, then return a new hash containing the pairs where the key
# is equal to the value.
#
# Examples:
#
# hash_1 = {x: 7, y: 1, z: 8}
# hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
#
# hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
# hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
# hash_2.my_select                            # => {4=>4}
class Hash
  def my_select(&prc)
    new_hash = {}
  
    if prc == nil
      self.each { |k, v| new_hash[k] = v if k == v }
    else
      self.each { |k, v| new_hash[k] = v if prc.call(k, v) }
    end

    # prc ||= self.each { |k, v| new_hash[k] = v if k == v }
    # self.each { |k, v| new_hash[k] = v if prc.call(k, v) }

    new_hash
  end
end


# Write a method, String#substrings, that takes in a optional length argument
# The method should return an array of the substrings that have the given length.
# If no length is given, return all substrings.
#
# Examples:
#
# "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
# "cats".substrings(2)  # => ["ca", "at", "ts"]
class String
  def substrings(length = nil)
    result = []

    j = 0
    while j < self.length

      i = j
      while i < self.length
        if length == nil
          result << self[j..i]
        else
          result << self[j..i] if self[j..i].length == length
        end

        i+=1
      end

      j+=1
    end

    result
  end
end

# p "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]

# Write a method, String#caesar_cipher, that takes in an a number.
# The method should return a new string where each char of the original string
# is shifted the given number of times in the alphabet.
#
# Examples:
#
# "apple".caesar_cipher(1)    #=> "bqqmf"
# "bootcamp".caesar_cipher(2) #=> "dqqvecor"
# "zebra".caesar_cipher(4)    #=> "difve"
class String
  def caesar_cipher(num)
    alphabet = ("a".."z").to_a
    ciphered = ""

    self.each_char do |char|
      if alphabet.include?(char)
        idx = alphabet.index(char)
        new_idx = (idx + num) % 26
        ciphered << alphabet[new_idx]
      end
    end 
      
    ciphered
  end
end