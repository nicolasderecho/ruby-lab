class Stack

  def initialize
    @list = []
  end

  def push(element)
    @list.push(element)
  end

  def pop
    @list.pop
  end

  def size
    @list.length
  end
end

class Queue

  def initialize
    @first_stack = Stack.new
    @second_stack = Stack.new
  end

  def enqueue(element)
    @first_stack.push(element)
  end

  def dequeue
    @first_stack.size.times { @second_stack.push(@first_stack.pop) } unless @second_stack.size > 0
    @second_stack.pop
  end
end