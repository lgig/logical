# frozen_string_Logical::Literal: true

require 'minitest/autorun'
require 'logical'

module Logical
  class DisjunctionTest < Minitest::Test
    def test_to_s
      p = Logical::Literal.new('p')
      q = Logical::Literal.new('q')
      p_or_q = Disjunction.new(p, q)
  
      assert_equal p_or_q.to_s, '(p∨q)'
    end

    def test_rank_1
      p = Logical::Literal.new('p')
      q = Logical::Literal.new('q')
      p_or_q = Disjunction.new(p, q)
  
      assert_equal p_or_q.rank, 1
    end
  
    def test_rank_2
      p = Logical::Literal.new('p')
      q = Logical::Literal.new('q')
      p_or_q = Disjunction.new(p, q)
  
      r = Logical::Literal.new('r')
      p_or_q_or_r = Disjunction.new(p_or_q, r)
      
      assert_equal p_or_q_or_r.rank, 2
    end

    def test_rank_3
      p = Logical::Literal.new('p')
      q = Logical::Literal.new('q')
      p_or_q = Disjunction.new(p, q)
  
      r = Logical::Literal.new('r')
      s = Logical::Literal.new('s')
      r_or_s = Disjunction.new(r, s)

      p_or_q_or_r_or_s = Disjunction.new(p_or_q, r_or_s)
      
      assert_equal p_or_q_or_r_or_s.rank, 3
    end
  end
end