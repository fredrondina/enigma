require 'pry'

class Enigma

  def initialize

  end
  #
  # def encrypt(message, key, date)
  #
  # end

  def offset(date)
    offset = (date.to_i * date.to_i).to_s[-4..-1].split(//)
    # binding.pry
  end

  # def shift
  #
  # end
end
