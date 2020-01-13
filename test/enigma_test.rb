require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require_relative "../lib/message"
require_relative "../lib/enigma"

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
    @message = Message.new("This is test text to scamble")
  end

  def test_enigma_exists
    assert_instance_of Enigma, @enigma
  end

  def test_offset_can_be_generated
    assert_equal @enigma.offset("111111"), ["4", "3", "2", "1"]
  end

  # def test_key_array_can_be_generated
  #   @enigma.key = 98456
  #   assert_equal @enigma.key_array_generator, ["98", "84", "45", "56"]
  # end

  # def test_shift_can_be_calculated
  #     @enigma.offset("111111")
  #     @enigma.key_array_generator
  #     @enigma.shift
  #     assert_equal @enigma.shift_key, [102, 87, 47, 57]
  # end

  # def test_it_can_encript_a_message
  #   assert_equal @enigma.encrypt("abcdef", "98456", "121212"), "znyjcr"
  # end

  def test_it_can_encript_a_message_and_return_a_hash
    expected = {
     encryption: "keder ohulw",
     key: "02715",
     date: "040895"
   }
    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_decript_a_message_and_return_a_hash
    expected = {
     decryption: "hello world",
     key: "02715",
     date: "040895"
   }
    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_encryption_can_encrypt_when_not_provided_date
    refute_equal "hello world", @enigma.encrypt("hello world", "02715")[:encryption]
    assert_equal 11, @enigma.encrypt("hello world", "02715")[:encryption].length
  end
end
