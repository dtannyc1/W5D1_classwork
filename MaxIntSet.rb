class MaxIntSet
    def initialize(max)
        @store = Array.new(max) {false}
    end

    def insert(num)
        raise "Out of bounds" if num < 0 || num >= @store.length
        @store[num] = true
    end

    def remove(num)
        raise "Out of bounds" if num < 0 || num >= @store.length
        @store[num] = false
    end

    def include?(num)
        raise "Out of bounds" if num < 0 || num >= @store.length
        @store[num]
    end
end
