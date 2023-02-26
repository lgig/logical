# frozen_string_literal: true

require 'minitest/autorun'
require 'logical'

class DisjunctionTest < Minitest::Test
  def test_to_s
    p = Literal.new('p')
    q = Literal.new('q')
    p_or_q = Disjunction.new(p, q)

    assert_equal p_or_q.to_s, '(p∨q)'
  end
end
