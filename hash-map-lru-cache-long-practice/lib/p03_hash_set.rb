class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if !include?(key)
        self[key] << key
        @count += 1
        if @count > self.num_buckets
            self.resize!
        end
        return true
    else
        return false
    end
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if include?(key)
        self[key].delete(key)
        @count -= 1
    end
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets*2) { Array.new }
    @store.each do |arr|
        arr.each do |ele|
            new_store[ele.hash % (num_buckets*2)] << ele
        end
    end
    @store = new_store
  end

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num.hash % num_buckets]
  end
end
