require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require_relative "../lib/key_gen"

class KeyGenTest < Minitest::Test

  def setup
    @key = KeyGen.new
  end

  def test_key_exists
    assert_instance_of KeyGen, @key
  end
end
