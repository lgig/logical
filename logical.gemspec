# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = 'logical'
  s.version     = '0.1.0'
  s.summary     = 'A silly Ruby implementation of some mathematical logic concepts.'
  s.description = ''
  s.authors     = ['Luka Giga']
  s.licenses    = ['MIT']
  s.homepage    = 'https://github.com/lgig/logical'
  s.files       = Dir['{lib}/**/*.rb', 'bin/*', 'MIT-LICENSE', '*.md']

  s.add_development_dependency 'minitest', '~> 5.8'
end
