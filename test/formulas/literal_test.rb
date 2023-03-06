# frozen_string_Logical::Literal: true

require 'minitest/autorun'
require 'logical'

module Logical
  class LiteralTest < Minitest::Test
    def test_symbol
      assert_equal Logical::Literal.new(:p).letter, :p
    end

    def test_string
      error = assert_raises(ArgumentError) do
        Logical::Literal.new('p')
      end

      assert_equal error.message, 'Argument must be a symbol.'
    end
  
    def test_to_s
      assert_equal Logical::Literal.new(:p).to_s, :p
    end

    def test_rank_1
      assert_equal Logical::Literal.new(:p).rank, 0
    end
  end
end
