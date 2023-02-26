# frozen_string_literal: true

require 'minitest/autorun'
require 'logical'

class ConjunctionTest < Minitest::Test
  def test_to_s
    p = Literal.new('p')
    q = Literal.new('q')
    p_and_q = Conjunction.new(p, q)

    assert_equal p_and_q.to_s, '(p∧q)'
  end
end
