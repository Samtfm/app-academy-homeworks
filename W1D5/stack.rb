class Stack
  def initialize
    @elements = []
    # create ivar to store stack here!
  end

  def add(el)
    @elements << el
    # adds an element to the stack
  end

  def remove
    @elements.pop
    # removes one element from the stack
  end

  def show
    @elements.dup
    # return a copy of the stack
  end
end
