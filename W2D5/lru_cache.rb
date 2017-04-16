class LRUCache
  def initialize(size)
    @size = size
    @store = []
  end

  def count
    @store.length
    # returns number of elements currently in cache
  end

  def add(el)
    @store.delete(el)
    @store << el
    if @store.length > @sizer
      @store.shift
    end
    # adds element to cache according to LRU principle
  end

  def show
    @store.dup
    # shows the items in the cache, with the LRU item first
  end

  private
  # helper methods go here!

end
johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

p johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})


p johnny_cache.show
