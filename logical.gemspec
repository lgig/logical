# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = 'logical'
  s.version     = '0.1.0'
  s.summary     = 'A silly Ruby implementation of some mathematical logic concepts.'
  s.description = ''
  s.authors     = ['Luka Giga']
  s.licenses    = ['MIT']
  s.homepage    = 'https://github.com/lgig/logical'
  s.add_development_dependency 'minitest', '~> 5.8'
  s.files       = ['lib/logical.rb',
                   'lib/logical/interpretation.rb',
                   'lib/logical/evaluation.rb',
                   'lib/logical/formulas/conjunction.rb',
                   'lib/logical/formulas/disjunction.rb',
                   'lib/logical/formulas/implication.rb',
                   'lib/logical/formulas/negation.rb',
                   'lib/logical/formulas/literal.rb',
                   'lib/logical/algorithms/truth_table.rb',]
end
