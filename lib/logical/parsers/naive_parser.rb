# frozen_string_literal: true

module Logical
  ##
  # A naive LL parser for the simplest propositional logic expression grammar
  class NaiveParser
    # TODO: document grammar
    def self.parse(string)
      raise 'empty string is not a valid expression' if string.empty?

      tokens = tokenize(string)
      lexe(tokens)
    end

    private

    def self.tokenize(string)
      string.split('')
    end

    def self.lexe(tokens)
      token = tokens.shift
      case token
      when '('
        lexe_binary(tokens)        
      when Negation::SYMBOL
        Negation.new(lexe(tokens))
      else
        if token.match?(/[[:alpha:]]/)
          Literal.new(token.to_sym)
        else
          raise "Unknown token: #{token}"
        end
      end
    end
    
    def self.lexe_binary(tokens)
      left = lexe(tokens)
      operator = tokens.shift
      right = lexe(tokens)
      trailer = tokens.shift

      raise "Expected ')' instead of: #{trailer}" unless trailer == ')'

      case operator
      when Conjunction::SYMBOL
        Conjunction.new(left, right)
      when Disjunction::SYMBOL
        Disjunction.new(left, right)
      when Implication::SYMBOL
        Implication.new(left, right)
      else
        raise "Unknown operator: #{operator}"
      end
    end
  end
end
