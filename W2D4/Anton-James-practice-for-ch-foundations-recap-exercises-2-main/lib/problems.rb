require "byebug"
# Write a method, least_common_multiple, that takes in two numbers and returns
# the smallest number that is a mutiple of both of the given numbers
def least_common_multiple(num_1, num_2)
  ch_num = 1

  while ch_num != num_1 * num_2
    if ch_num % num_1 == 0 && ch_num % num_2 == 0
      return ch_num
    end
      ch_num += 1
  end

end


# Write a method, most_frequent_bigram, that takes in a string and returns the
# two adjacent letters that appear the most in the string.
def most_frequent_bigram(str)
  c_w = ""
  ctr = 0
  bigrams = bigrams_creator(str)
  # debugger
  j = 0
  while j < bigrams.length
    counter = 0
    i = 0
    while i < str.length-1
      if str[i] + str[i+1] == bigrams[j]
        counter += 1
      end
      i+=1
    end
    if ctr < counter
      ctr = counter
      c_w = bigrams[j]
    end
    j+=1
  end

  c_w
end

def bigrams_creator(str)
  bigrams = []
  
  str[0...-1].each_char.with_index do |ele, idx|
    bigrams << str[idx] + str[idx+1]
  end
  
  bigrams
end


class Hash
  # Write a method, Hash#inverse, that returns a new hash where the key-value
  # pairs are swapped
  def inverse
    new_hash = {}
    self.each { |k, v| new_hash[v] = k }
    new_hash
  end
end


class Array
  # Write a method, Array#pair_sum_count, that takes in a target number returns
  # the number of pairs of elements that sum to the given target
  def pair_sum_count(num)
    counter = 0
    self.each_with_index do |ele1, idx1|
      self.each_with_index do |ele2, idx2|
        if idx2 > idx1 && ele2 + ele1 == num
          counter += 1
        end
      end
    end
    counter
  end

  

  # Write a method, Array#bubble_sort, that takes in an optional proc argument.
  # When given a proc, the method should sort the array according to the proc.
  # When no proc is given, the method should sort the array in increasing order.
  #
  # Sorting algorithms like bubble_sort commonly accept a block. That block
  # accepts two parameters, which represents the two elements in the array being
  # compared. If the block returns 1, it means that the second element passed to
  # the block should go before the first (i.e., switch the elements). If the
  # block returns -1, it means the first element passed to the block should go
  # before the second (i.e., do not switch them). If the block returns 0 it
  # implies that it does not matter which element goes first (i.e., do nothing).
  #
  # This should remind you of the spaceship operator! Convenient :)
  def bubble_sort(&prc)
    if prc == nil
      sorted = false

      while sorted == false
        sorted = true
        # debugger
        self[0...-1].each_with_index do |ele, idx|
          if self[idx] > self[idx+1]
            self[idx], self[idx+1] = self[idx+1], self[idx]
            sorted = false
          end
        end
      end

    else
      #smtn with prc???
    end

    self
  end

  p [4, 12, 2, 8, 1, 14, 9, 25, 24, 81].bubble_sort

end