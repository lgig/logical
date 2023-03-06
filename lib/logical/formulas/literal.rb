# frozen_string_literal: true

module Logical
  class Literal
    attr_reader :letter
  
    def initialize(letter)
      raise ArgumentError, 'Argument must be a symbol.' unless letter.is_a? Symbol

      @letter = letter
    end
  
    def evaluate(interpretation)
      interpretation.evaluate(@letter)
    end
  
    def to_s
      @letter
    end
  
    def literals
      Set[self]
    end
  
    def ==(other)
      other.class == Literal && other.letter == letter
    end

    def rank
      0
    end
  end
end
