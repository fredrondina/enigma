require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require_relative "../lib/message"


class MessageTest < Minitest::Test

  def setup
    @message = Message.new("This is test text")
  end

  def test_message_exists
    assert_instance_of Message, @message
  end

  def test_text_can_be_split_into_arrays_of_4
    assert_equal @message.split_text[0].length, 4
    assert_equal @message.split_text[1].length, 4
    assert_equal @message.split_text[1].length, 4
  end
end
