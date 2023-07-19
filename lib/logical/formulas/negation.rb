# frozen_string_literal: true

module Logical
  class Negation
    SYMBOL = '¬'

    attr_reader :f

    def initialize(f)
      @f = f
    end
  
    def evaluate(interpretation)
      !(@f.evaluate(interpretation))
    end
    
    def to_s
      "#{SYMBOL}(#{@f.to_s})"
    end
  
    def literals
      @f.literals
    end

    def rank
      @f.rank + 1
    end

    def ==(other)
      other.is_a?(Negation) && other.f == @f
    end
  end
end
