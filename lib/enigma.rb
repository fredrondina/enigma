require 'pry'
require_relative "../lib/message"


class Enigma

  attr_reader :shift_key

  def initialize
    @offset = 0
    @key = 98456
    @key_array = []
    @shift_key = []
    @coded_text = []
    @rotate_helper = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p",
"q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
  end
  #
  def encrypt(message, shift)
      message.split_text.each do |segment|
        segment.each_with_index do |letter, index|
          rotate_amount = (@shift_key[index] + @rotate_helper.index(letter))
          @coded_text << @rotate_helper.rotate(rotate_amount).first
        end
    end
    @coded_text.join
  end

  def offset(date)
    @offset = (date.to_i * date.to_i).to_s[-4..-1].split(//)
    # binding.pry
  end

  def shift
    @key_array.each_with_index do |key, index|
      @shift_key << (key.to_i + @offset[index].to_i)
    end
  end

  def key_array_generator
      @key.to_s.split(//).each_with_index do |key, index|
          return @key_array if @key_array.length == 4
            @key_array << (key + @key.to_s[index+1])
      end
  end
end
