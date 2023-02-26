# frozen_string_literal: true

require 'minitest/autorun'
require 'logical'

class ImplicationTest < Minitest::Test
  def test_to_s
    p = Literal.new('p')
    q = Literal.new('q')
    p_then_q = Implication.new(p, q)

    assert_equal p_then_q.to_s, '(p→q)'
  end
end
