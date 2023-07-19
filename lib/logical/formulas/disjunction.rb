# frozen_string_literal: true

module Logical
  class Disjunction
    SYMBOL = '∨'

    attr_reader :f, :g

    def initialize(f, g)
      @f = f
      @g = g
    end
  
    def evaluate(interpretation)
      @f.evaluate(interpretation) || @g.evaluate(interpretation)
    end
  
    def literals
      @f.literals | @g.literals
    end
  
    def to_s
      "(#{@f.to_s}#{SYMBOL}#{@g.to_s})"
    end
    
    def rank
      @f.rank + @g.rank + 1
    end

    def ==(other)
      other.is_a?(Disjunction) && other.f == @f && other.g == @g
    end
  end
end
