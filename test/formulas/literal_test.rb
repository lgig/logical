# frozen_string_Logical::Literal: true

require 'minitest/autorun'
require 'logical'

module Logical
  class LiteralTest < Minitest::Test
    def test_letter
      assert_equal Logical::Literal.new('p').letter, 'p'
    end
  
    def test_to_s
      assert_equal Logical::Literal.new('p').to_s, 'p'
    end

    def test_rank_1
      assert_equal Logical::Literal.new('p').rank, 0
    end
  end
end
