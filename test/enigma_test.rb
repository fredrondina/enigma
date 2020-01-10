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
    assert_equal @enigma.offset("111111"), 4321
  end

  # def test_it_can_encript_a_message
  #
  # end
end
