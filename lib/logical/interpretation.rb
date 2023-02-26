# frozen_string_literal: true

class Interpretation
  def initialize(hash)
    @hash = hash
  end

  def evaluate(letter)
    @hash[letter]
  end

  def to_s
    @hash.to_s
  end

  def self.all(letters)
    [true, false]
      .repeated_permutation(letters.size)
      .map do |disposition|
      mapping = {}
      letters.each_with_index do |letter, i|
        mapping[letter] = disposition[i]
      end
      Interpretation.new(mapping)
    end
  end
end
