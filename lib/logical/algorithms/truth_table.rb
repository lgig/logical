# frozen_string_literal: true

class TruthTable
  attr_reader :evaluations
  
  def initialize(formula)
    @formula = formula
    letters = formula.literals.map(&:letter)
    @evaluations = Interpretation.all(letters).map { |i| Evaluation.new(i, formula) }
  end

  def valid?
    @evaluations.map(&:value).all?
  end

  def satisfied?
    @evaluations.map(&:value).any?
  end

  def invalid?
    !satisfied?
  end
end