require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
    def initialize(max, prc)
        @map = HashMap.new
        @store = LinkedList.new
        @max = max
        @prc = prc
    end

    def count
        @map.count
    end

    def get(key)
        if @map.include?(key)       # if it's already in cache
            node = @map[key]        # just get the node associated with the key
            update_node!(node)      # and update node to the end of cache
            return node.val         # then return value
        else
            return calc!(key)       # otherwise calculate and append
        end
    end

    def to_s
        'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
    end

    private

    def calc!(key)
        # suggested helper method; insert an (un-cached) key
        new_val = @prc.call(key)                # calculate the correct value
        eject! if @map.count+1 > @max           # eject one if cache is full
        new_node = @store.append(key, new_val)  # append a new node to @store
        @map.set(key, new_node)                 # add new node to map
        new_node.val                            # return the calculated value
    end

    def update_node!(node)
        # suggested helper method; move a node to the end of the list
        # should move node to end of @store LinkedList
        key = node.key              # grab correct key and value
        val = node.val
        node.remove                 # remove from @store
        @store.append(key, val)     # put it at the end of store
        @map[key] = @store.last     # update map
    end

    def eject!
        # @map is a HashMap
        # @store is a LinkedList
        key = @store.first.key      # grab the oldest key
        @store.first.remove         # remove item from @store
        @map.delete(key)            # remove item from @map
    end
end
