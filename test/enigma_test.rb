require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require_relative "../lib/message"
require_relative "../lib/enigma"

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_enigma_exists
    assert_instance_of Enigma, @enigma
  end

  def test_offset_can_be_generated
    assert_equal @enigma.offset("111111"), ["4", "3", "2", "1"]
  end

  def test_key_array_can_be_generated
    assert_equal @enigma.key_array_generator, ["98", "84", "45", "56"]
  end
  # def test_shift_can_be_calculated
  #     @enigma.offset("111111")
  #     @enigma.shift
  # end
  # def test_it_can_encript_a_message
  #
  # end
end
