require 'pry'

class KeyGen

 attr_reader :key, :date

  def initialize(key = random_number, date = todays_date)
    @key = key
    @date = date
  end

  def random_number
    rand(0..99999)
  end

  def todays_date
    Time.now.strftime("%d%m%y").to_i
  end
end
