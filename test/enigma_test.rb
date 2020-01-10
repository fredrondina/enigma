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
end
