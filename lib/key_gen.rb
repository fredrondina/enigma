require 'pry'

class KeyGen

 attr_reader :key

  def initialize(key = random_number)
    @key = key
  end

  def random_number
    rand(0..99999)
  end
end
