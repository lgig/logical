# frozen_string_literal: true

require 'minitest/autorun'
require 'logical'

module Logical
  class TruthTableTest < Minitest::Test
    def test_literal
      p = Logical::Literal.new(:p)
      truth_table = Logical::TruthTable.new(p)
  
      assert_equal truth_table.evaluations.size, 2
    end
  end
end