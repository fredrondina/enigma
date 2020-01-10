require 'pry'

class Enigma

  def initialize

  end
  # 
  # def encrypt(message, key, date)
  #
  # end

  def offset(date)
    offset = (date.to_i * date.to_i).to_s[-4..-1].to_i
    # binding.pry
  end
end
