# frozen_string_literal: true

class Negation
  def initialize(f)
    @f = f
  end

  def evaluate(interpretation)
    !(@f.evaluate(interpretation))
  end
  
  def to_s
    "¬(#{@f.to_s})"
  end

  def literals
    @f.literals
  end
end
