# frozen_string_literal: true

class Evaluation
  attr_reader :interpretation, :formula, :value

  def initialize(interpretation, formula)
    @interpretation = interpretation
    @formula = formula
    @value = formula.evaluate(interpretation)
  end

  def to_s
    "#{interpretation.to_s} ⇒ #{formula.to_s} = #{value}"
  end
end
