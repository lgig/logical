# frozen_string_Logical::Literal: true

require 'minitest/autorun'
require 'logical'

module Logical
  class ImplicationTest < Minitest::Test
    def test_to_s
      p = Logical::Literal.new(:p)
      q = Logical::Literal.new(:q)
      p_then_q = Implication.new(p, q)
  
      assert_equal p_then_q.to_s, '(p→q)'
    end

    def test_rank_1
      p = Logical::Literal.new(:p)
      q = Logical::Literal.new(:q)
      p_then_q = Implication.new(p, q)
  
      assert_equal p_then_q.rank, 1
    end
  
    def test_rank_2
      p = Logical::Literal.new(:p)
      q = Logical::Literal.new(:q)
      p_then_q = Implication.new(p, q)
  
      r = Logical::Literal.new(:r)
      p_then_q_then_r = Implication.new(p_then_q, r)
      
      assert_equal p_then_q_then_r.rank, 2
    end

    def test_rank_3
      p = Logical::Literal.new(:p)
      q = Logical::Literal.new(:q)
      p_then_q = Implication.new(p, q)
  
      r = Logical::Literal.new(:r)
      s = Logical::Literal.new(:s)
      r_then_s = Implication.new(r, s)

      p_then_q_then_r_then_s = Implication.new(p_then_q, r_then_s)
      
      assert_equal p_then_q_then_r_then_s.rank, 3
    end
  end
end
