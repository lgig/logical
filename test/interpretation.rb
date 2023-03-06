# frozen_string_literal: true

require 'minitest/autorun'
require 'logical'

module Logical
  class InterpretationTest < Minitest::Test
    def test_all_for_literal
      p = Literal.new('p')
      all_interpretations = Interpretation.all(p.literals.map(&:letter))
  
      assert_equal all_interpretations.size, 2
    end
  
    def test_all_for_conjunction
      p = Literal.new('p')
      q = Literal.new('q')
      p_and_q = Conjunction.new(p, q)
  
      all_interpretations = Interpretation.all(p_and_q.literals.map(&:letter))
  
      assert_equal all_interpretations.size, 4
    end
  end
end