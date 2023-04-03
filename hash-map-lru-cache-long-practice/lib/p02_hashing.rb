class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    outHash = 0
    self.each_with_index do |ele, ii|
        outHash += ele.hash * ii.hash
    end
    outHash
  end
end

class String
  def hash
    alphabet = ("a".."z").to_a
    string_to_intArray = self.split("").map {|char| alphabet.index(char)}
    string_to_intArray.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
    def hash
        outHash = 0
        self.each do |key, value|
            outHash += key.hash * value.hash
        end
        outHash
    end
end
