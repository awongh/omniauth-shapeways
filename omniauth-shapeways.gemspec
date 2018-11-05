# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-shapeways/version'

Gem::Specification.new do |gem|
  gem.name          = "omniauth-shapeways"
  gem.version       = OmniAuth::Shapeways::VERSION
  gem.authors       = ["John Barton"]
  gem.email         = ["jb@phy5ics.com"]
  gem.description   = %q{Omniauth strategy for Shapeways.}
  gem.summary       = %q{Omniauth strategy for Shapeways.}
  gem.homepage      = "https://github.com/phy5ics/omniauth-shapeways"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_dependency 'omniauth-oauth2', '~> 1.5.0'
  gem.add_dependency 'multi_json'
  gem.add_dependency 'json'
  
  gem.add_development_dependency 'byebug'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'webmock'
  gem.add_development_dependency 'vcr'
  
end
