# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name    = 'rouge-lexers-pokepaste'
  s.version = '0.1.0'
  s.authors = ['Felix Friedlander']
  s.email   = 'felix@ffetc.net'

  s.license = 'BSD-3-Clause'
  s.summary = 'Rouge lexer for PokePaste / PS / PKHex import / exports'
  s.files   = Dir['LICENSE', 'rouge-lexers-pokepaste.gemspec', 'lib/rouge/lexers/pokepaste.rb', 'lib/rouge/lexers/pokepaste/*.rb']
end
