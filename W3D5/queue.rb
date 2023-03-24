class Queue
    attr_reader :arr_var

    def initialize
        @arr_var = []
    end

    def peek
        @arr_var.last
    end

    def dequeue
        @arr_var.pop
    end

    def enqueue(el)
        @arr_var.push(el)
    end
end

my_queue = Queue.new

my_queue.enqueue("hi")
my_queue.enqueue("my")
my_queue.enqueue("name")
p my_queue
my_queue.dequeue
p my_queue
p my_queue.peek
