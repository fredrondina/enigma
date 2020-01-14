require 'pry'
require_relative "../lib/message"
require_relative "../lib/key_gen"

class Enigma

  attr_reader :shift_key

  def initialize
    @offset = 0
    @key = 0
    @key_array = []
    @shift_key = []
    @coded_text = []
    @rotate_helper = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k",
    "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    @special_characters = ["!", ".", "?", "'", ","]
  end
  #
  def encrypt(message, key=nil, date=nil)
      @coded_text = []
      key = KeyGen.new.key if key == nil
      date = KeyGen.new.date if date == nil
      @key = key
      offset(date)
      shift
      split_text(message).each do |segment|
        segment.each_with_index do |letter, index|
          if @special_characters.include?(letter)
            @coded_text << letter
          else
            rotate_amount = (@shift_key[index] + @rotate_helper.index(letter))
            @coded_text << @rotate_helper.rotate(rotate_amount).first
          end
        end
    end
   return  encryption_hash(@coded_text.join, key, date)
  end

  def decrypt(message, key, date=nil)
      @coded_text = []
      @key = key
      date = KeyGen.new.date if date == nil
      offset(date)
      shift
      split_text(message).each do |segment|
        segment.each_with_index do |letter, index|
          rotate_amount = (@rotate_helper.index(letter) - @shift_key[index])
          @coded_text << @rotate_helper.rotate(rotate_amount).first
        end
    end
   return  decryption_hash(@coded_text.join, key, date)
  end

  def offset(date)
    @offset = (date.to_i * date.to_i).to_s[-4..-1].split(//)
  end

  def shift
    @shift_key = []
    key_array_generator
    @key_array.each_with_index do |key, index|
      @shift_key << (key.to_i + @offset[index].to_i)
    end
  end

  def key_array_generator
    @key_array = []
      @key.to_s.split(//).each_with_index do |key, index|
          return @key_array if @key_array.length == 4
            @key_array << (key + @key.to_s[index+1])
      end
  end

  def split_text(message)
    split_text = message.downcase.split(//).each_slice(4).to_a
  end

  def encryption_hash(coded_message, key, date)
    encryption_results = {}
    encryption_results[:encryption] = coded_message.to_s
    encryption_results[:key] = key.to_s
    encryption_results[:date] = date.to_s
    return encryption_results
  end

  def decryption_hash(coded_message, key, date)
    decryption_results = {}
    decryption_results[:decryption] = coded_message.to_s
    decryption_results[:key] = key.to_s
    decryption_results[:date] = date.to_s
    return decryption_results
  end

end
