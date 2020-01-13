require 'pry'

class KeyGen

 attr_reader :key, :date

  def initialize(key = random_number, date = todays_date)
    @key = key
    @date = date
  end

  def random_number
    rand_num = 0
      until rand_num.to_s.length == 5
        rand_num = rand(0..99999)
      end
    return rand_num
  end

  def todays_date
    Time.now.strftime("%d%m%y").to_i
  end
end
