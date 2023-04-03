class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    @prev.next = self.next
    @next.prev = self.prev
  end

end

class LinkedList
    include Enumerable

    def initialize
        @head = Node.new
        @tail = Node.new
        @head.next = @tail
        @tail.prev = @head
    end

    def [](i)
        current_node = @head
        (i+1).times do
            current_node = current_node.next
            return nil if current_node == @tail
        end
        return current_node
    end

    def first
        return nil if @head.next == @tail
        @head.next
    end

    def last
        return nil if @tail.prev == @head
        @tail.prev
    end

    def empty?
        @head.next == @tail
    end

    def get(key)
        current_node = @head
        until current_node == @tail
            return current_node.val if current_node.key == key
            current_node = current_node.next
        end
        nil
    end

    def include?(key)
        !self.get(key).nil?
    end

    def append(key, val)
        new_node = Node.new(key, val)
        last_node = self.last || @head
        new_node.prev = last_node
        last_node.next = new_node
        new_node.next = @tail
        @tail.prev = new_node
    end

    def update(key, val)
        current_node = @head
        until current_node == @tail
            if current_node.key == key
                current_node.val = val
                return true
            end
            current_node = current_node.next
        end
        false
    end

    def remove(key)
        current_node = @head
        until current_node == @tail
            if current_node.key == key
                current_node.remove
                return true
            end
            current_node = current_node.next
        end
        false
    end

    def each(&prc)
        current_node = @head.next
        until current_node == @tail
            prc.call(current_node)
            current_node = current_node.next
        end
        return
    end

    # uncomment when you have `each` working and `Enumerable` included
    # def to_s
    #   inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
    # end
end
