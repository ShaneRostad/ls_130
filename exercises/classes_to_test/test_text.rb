require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

require_relative 'text'


class TextTest < Minitest::Test
  def setup
    @file = File.open('sample.txt', 'r')
  end

  def test_swap_method
    text = Text.new(@file.read)
    actual_text = text.swap('a', 'e')
    expected_text = <<~TEXT
    Lorem ipsum dolor sit emet, consectetur edipiscing elit.
    TEXT

    assert_equal(expected_text, actual_text)
  end

  def test_word_count
    text = Text.new(@file.read)
    word_count = text.word_count

    assert_equal(8, word_count)
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end

end
