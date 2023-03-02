# frozen_string_literal: true

class Literal
  attr_reader :letter

  def initialize(letter)
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
end