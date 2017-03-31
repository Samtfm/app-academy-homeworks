class Queue

  def initialize
    @elements = []
  end

  def enqueue(el)
    @elements << el
  end

  def dequeue
    @elements.shift
  end

  def show
    @elements.dup
  end

end
