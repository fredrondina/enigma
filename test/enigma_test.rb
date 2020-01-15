require 'pry'
require'simplecov'
SimpleCov.start
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
    assert_equal ["4", "3", "2", "1"], @enigma.calculate_offset("111111")
  end

  def test_key_array_can_be_generated
    @enigma.key = 98456
    assert_equal ["98", "84", "45", "56"], @enigma.key_array_generator
  end

  def test_text_can_be_split_into_arrays_of_4
    assert_includes @enigma.split_text("beepboop"), ["b", "e", "e", "p"]

  end

  def test_shift_can_be_calculated
      @enigma.calculate_offset("111111")
      @enigma.key = "55555"
      @enigma.shift
      assert_equal [59, 58, 57, 56], @enigma.shift_key
  end

  def test_special_characters_are_not_encrypted
    expected = {
     encryption: "!,'.?",
     key: "02715",
     date: "040895"
   }
    assert_equal expected, @enigma.encrypt("!,'.?", "02715", "040895")
  end

  def test_special_characters_are_not_changed_during_decryption
    expected = {
     decryption: "hello ?!",
     key: "02715",
     date: "040895"
   }
    assert_equal expected, @enigma.decrypt("keder ?!", "02715", "040895")
  end
  def test_it_can_encript_a_message_and_return_a_hash
    expected = {
     encryption: "keder ohulw!",
     key: "02715",
     date: "040895"
   }
    assert_equal expected, @enigma.encrypt("hello world!", "02715", "040895")
  end

  def test_it_can_decript_a_message_and_return_a_hash
    expected = {
     decryption: "hello world",
     key: "02715",
     date: "040895"
   }
    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_enigma_can_decrypt_without_a_date
    expected = {
     decryption: "hello world",
     key: "02715",
     date: "150120"
    }
    assert_equal expected, @enigma.decrypt("nib udmcxpu", "02715")
  end

  def test_encryption_can_encrypt_when_not_provided_key
    refute_equal "hello world", @enigma.encrypt("hello world", "130120")[:encryption]
    assert_equal 11, @enigma.encrypt("hello world", "130120")[:encryption].length
  end

  def test_encryption_can_encrypt_when_not_provided_key_or_date
    refute_equal "hello world", @enigma.encrypt("hello world")[:encryption]
    assert_equal 11, @enigma.encrypt("hello world")[:encryption].length
  end
end
