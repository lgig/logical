# frozen_string_literal: true

require 'minitest/autorun'
require 'logical'

class LiteralTest < Minitest::Test
  def test_letter
    assert_equal Literal.new('p').letter, 'p'
  end

  def test_to_s
    assert_equal Literal.new('p').to_s, 'p'
  end
end