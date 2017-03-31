class Map

  def initialize
    @defs = []
  end

  def assign(key, value)
    @defs.each do |pair|
      if pair[0] == key
        pair[1] = value
        return [key, value]
      end
    end
    @defs << [key, value]
    return [key, value]
  end

  def lookup(key)
    @defs.each do |pair|
      return pair[1] if key == pair[0]
    end
    nil
  end

  def remove(key)
    @defs.each do |pair|
      return @defs.delete(pair) if key == pair[0]
    end
    nil
  end

  def show
    @defs.dup
  end

end
