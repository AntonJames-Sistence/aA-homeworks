class Stack
    def initialize
      # create ivar to store stack here!
      ivar = nil
    end
  
    def push(el)
      # adds an element to the stack
      self << el
    end
  
    def pop
      # removes one element from the stack
      self.pop
    end
  
    def peek
      # returns, but doesn't remove, the top element in the stack
      self.last
    end
  end