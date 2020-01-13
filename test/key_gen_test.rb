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

  def test_key_can_generate_random_key
    assert_equal  5, @key.key.to_s.length
  end

  def test_keygen_can_get_todays_date
    assert_equal 6, @key.date.to_s.length
  end
end
