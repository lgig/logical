# frozen_string_literal: true

require 'minitest/autorun'
require 'logical'

class TruthTableTest < Minitest::Test
  def test_literal
    p = Literal.new('p')
    truth_table = TruthTable.new(p)

    assert_equal truth_table.evaluations.size, 2
  end
end
