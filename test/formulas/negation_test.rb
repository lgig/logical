# frozen_string_Logical::Literal: true

require 'minitest/autorun'
require 'logical'

module Logical
  class NegationTest < Minitest::Test
    def test_to_s
      p = Logical::Literal.new(:p)
      not_p = Negation.new(p)
  
      assert_equal not_p.to_s, '¬(p)'
    end

    def test_rank
      p = Logical::Literal.new(:p)
      not_p = Negation.new(p)
  
      assert_equal not_p.rank, 1
    end
  end
end
