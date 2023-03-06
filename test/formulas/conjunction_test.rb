# frozen_string_Logical::Literal: true

require 'minitest/autorun'
require 'logical'

module Logical
  class ConjunctionTest < Minitest::Test
    def test_to_s
      p = Logical::Literal.new(:p)
      q = Logical::Literal.new(:q)
      p_and_q = Conjunction.new(p, q)
  
      assert_equal p_and_q.to_s, '(p∧q)'
    end
  
    def test_rank_1
      p = Logical::Literal.new(:p)
      q = Logical::Literal.new(:q)
      p_and_q = Conjunction.new(p, q)
  
      assert_equal p_and_q.rank, 1
    end
  
    def test_rank_2
      p = Logical::Literal.new(:p)
      q = Logical::Literal.new(:q)
      p_and_q = Conjunction.new(p, q)
  
      r = Logical::Literal.new(:r)
      p_and_q_and_r = Conjunction.new(p_and_q, r)
      
      assert_equal p_and_q_and_r.rank, 2
    end

    def test_rank_3
      p = Logical::Literal.new(:p)
      q = Logical::Literal.new(:q)
      p_and_q = Conjunction.new(p, q)
  
      r = Logical::Literal.new(:r)
      s = Logical::Literal.new(:s)
      r_and_s = Conjunction.new(r, s)

      p_and_q_and_r_and_s = Conjunction.new(p_and_q, r_and_s)
      
      assert_equal p_and_q_and_r_and_s.rank, 3
    end

    def test_equal_1
      p = Logical::Literal.new(:p)
      q = Logical::Literal.new(:q)
      p_and_q_1 = Conjunction.new(p, q)
      p_and_q_2 = Conjunction.new(p, q)
  
      assert_equal p_and_q_1, p_and_q_2
    end
    
    def test_equal_2
      p = Logical::Literal.new(:p)
      q = Logical::Literal.new(:q)
      r = Logical::Literal.new(:r)
      p_and_q = Conjunction.new(p, q)
      p_and_r = Conjunction.new(p, r)
  
      refute_equal p_and_q, p_and_r
    end
    
    def test_equal_3
      p = Logical::Literal.new(:p)
      q = Logical::Literal.new(:q)
      p_and_q_1 = Conjunction.new(p, q)
      p_or_q_2 = Disjunction.new(p, q)
  
      refute_equal p_and_q_1, p_or_q_2
    end
  end
end
