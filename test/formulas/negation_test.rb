# frozen_string_literal: true

require 'minitest/autorun'
require 'logical'

class NegationTest < Minitest::Test
  def test_to_s
    p = Literal.new('p')
    not_p = Negation.new(p)

    assert_equal not_p.to_s, '¬(p)'
  end
end