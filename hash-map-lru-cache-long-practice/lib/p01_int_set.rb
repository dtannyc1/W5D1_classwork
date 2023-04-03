class MaxIntSet
    attr_reader :store
    def initialize(max)
        @store = Array.new(max) {false}
    end

    def insert(num)
        if is_valid?(num)
            @store[num] = true
            return true
        else
            return false
        end
    end

    def remove(num)
        @store[num] = false if is_valid?(num)
    end

    def include?(num)
        @store[num] if is_valid?(num)
    end

    private

    def is_valid?(num)
        raise "Out of bounds" if num < 0 || num >= @store.length
        true
    end

    def validate!(num)
    end
end

class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    if !include?(num)
        self[num] << num
        return true
    else
        return false
    end
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % self.num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
  end

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end
end
