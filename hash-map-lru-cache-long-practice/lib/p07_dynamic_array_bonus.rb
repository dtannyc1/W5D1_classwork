class StaticArray
  attr_reader :store

  def initialize(capacity)
    @store = Array.new(capacity)
  end

  def [](i)
    validate!(i)
    self.store[i]
  end

  def []=(i, val)
    validate!(i)
    self.store[i] = val
  end

  def length
    self.store.length
  end

  private

  def validate!(i)
    raise "Overflow error" unless i.between?(0, self.store.length - 1)
  end
end

class DynamicArray
    include Enumerable
    attr_accessor :count

    def initialize(capacity = 8)
        @store = StaticArray.new(capacity)
        @count = 0
    end

    def [](i)
        i = @count + i if i < 0
        return @store[i] if i >= 0 && i < @store.length
        nil
    end

    def []=(i, val)
        i = @count + i if i < 0
        until i < @store.length
            self.resize!
        end
        @count = i+1 if i+1 > @count
        @store[i] = val if i >= 0 && i < @store.length
    end

    def capacity
        @store.length
    end

    def include?(val)
        (0...@count).each do |ii|
            return true if @store[ii] == val
        end
        false
    end

    def push(val)
        self.resize! if @count + 1 > capacity
        @count += 1
        self[@count-1] = val
    end

    def unshift(val)
        self.resize! if @count + 1 > capacity
        (1..@count).to_a.reverse.each do |ii|
            self[ii] = self[ii-1]
        end
        self[0] = val
        @count += 1
        val
    end

    def pop
        return nil if @count == 0    # nil if empty
        val = self[@count-1]     # temporarily store value
        self[@count-1] = nil     # pop out item
        @count -= 1              # update count
        val                     # return value
    end

    def shift
        return nil if @count == 0    # nil if empty
        val = self[0]           # temporarily store value
        (1...@count).each do |ii|
            self[ii-1] = self[ii] # move everything backwards in the array
        end
        self[@count-1] = nil       # set last element to nil
        @count -= 1                # update count
        val                       # return value
    end

    def first
        self[0]
    end

    def last
        self[@count-1]
    end

    def each(&prc)
        (0...@count).each do |ii|
            prc.call(self[ii])
        end
    end

    def to_s
        "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
    end

    def ==(other)
        return false unless [Array, DynamicArray].include?(other.class)
        # Your code here
        new_array = []
        (0...@count).each do |ii|
            new_array << self[ii]
        end
        comparison_array = []
        if other.class == DynamicArray
            (0...other.count).each do |ii|
                comparison_array << other[ii]
            end
        else
            comparison_array = other
        end
        new_array == comparison_array
    end

    def inspect
        new_array = []
        (0...@count).each do |ii|
            new_array << self[ii]
        end
        new_array
    end

    alias_method :<<, :push
    %i(length size).each { |method| alias_method method, :count }

    private

    def resize!
        new_array = StaticArray.new(capacity*2)
        self.each_with_index do |ele, ii|
            new_array[ii] = ele
        end
        @store = new_array
    end
end
