# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'quickmods/version'

Gem::Specification.new do |spec|
  spec.name          = 'quickmods'
  spec.version       = QuickMods::VERSION
  spec.authors       = ['Kepler Sticka-Jones']
  spec.email         = ['kbsj269@gmail.com']
  spec.summary       = %q{Ruby gem for quickmods.}
  spec.homepage      = ''
  spec.license       = 'GNU Public License Version 3'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency "rspec"
end
