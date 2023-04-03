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
    outHash = 0
    alphabet = ("a".."z").to_a
    self.each_char.with_index do |char, ii|
        outHash += (alphabet.index(char)).hash * ii.hash
    end
    outHash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
