# frozen_string_Logical::Literal: true

require 'minitest/autorun'
require 'logical'

module Logical
  class NaiveParserTest < Minitest::Test
    def test_empty_string
      error = assert_raises(StandardError) do
        Logical::NaiveParser.parse('')
      end

      assert_equal error.message, 'empty string is not a valid expression'
    end

    def test_literal
      parsed_expression = Logical::NaiveParser.parse('a')
      expected_expression = Logical::Literal.new(:a)

      assert_equal parsed_expression, expected_expression
    end

    def test_negation
      parsed_expression = Logical::NaiveParser.parse('¬a')
      expected_expression = Logical::Negation.new(
        Logical::Literal.new(:a)
      )

      assert_equal parsed_expression, expected_expression
    end

    def test_conjunction
      parsed_expression = Logical::NaiveParser.parse('(a∧b)')
      expected_expression = Logical::Conjunction.new(
        Logical::Literal.new(:a),
        Logical::Literal.new(:b))

      assert_equal parsed_expression, expected_expression
    end
    
    def test_disjunction
      parsed_expression = Logical::NaiveParser.parse('(a∨b)')
      expected_expression = Logical::Disjunction.new(
        Logical::Literal.new(:a),
        Logical::Literal.new(:b))

      assert_equal parsed_expression, expected_expression
    end
    
    def test_implication
      parsed_expression = Logical::NaiveParser.parse('(a→b)')
      expected_expression = Logical::Implication.new(
        Logical::Literal.new(:a),
        Logical::Literal.new(:b))

      assert_equal parsed_expression, expected_expression
    end

    def test_left_nested
      parsed_expression = Logical::NaiveParser.parse('(((a∧¬b)∨b)→b)')
      expected_expression =
        Logical::Implication.new(
          Logical::Disjunction.new(
            Logical::Conjunction.new(
              Logical::Literal.new(:a),
              Logical::Negation.new(
                Logical::Literal.new(:b)
              )
            ),
            Logical::Literal.new(:b)
          ),
          Logical::Literal.new(:b)
        )

      assert_equal parsed_expression.to_s, expected_expression.to_s
    end

    def test_right_nested
      parsed_expression = Logical::NaiveParser.parse('(a→(a∨(a∧¬b)))')
      expected_expression =
        Logical::Implication.new(
          Logical::Literal.new(:a),
          Logical::Disjunction.new(
            Logical::Literal.new(:a),
            Logical::Conjunction.new(
              Logical::Literal.new(:a),
              Logical::Negation.new(
                Logical::Literal.new(:b)
              )
            )
          )
        )

      assert_equal parsed_expression.to_s, expected_expression.to_s
    end
  end
end
