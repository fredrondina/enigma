require 'pry'

class Message

  attr_accessor :text

  def initialize(text)
    @text = text
  end

  # def split_text
  #   split_text = @text.downcase.split(//).each_slice(4).to_a
  #   binding.pry
  # end
end
