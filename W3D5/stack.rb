class Stack
    attr_reader :ivar

    def initialize
      # create ivar to store stack here!
      @ivar = []
    end
  
    def push(el)
      # adds an element to the stack
      @ivar.push(el)
    end
  
    def pop
      # removes one element from the stack
      @ivar.pop
    end
  
    def peek
      # returns, but doesn't remove, the top element in the stack
      @ivar.last
    end
  end

  my_stack = Stack.new

  p my_stack
  my_stack.push("hi")
  p my_stack
  p my_stack.peek
  my_stack.push(3)
  p my_stack
  my_stack.pop
  p my_stack