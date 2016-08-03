# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'elyan'

Gem::Specification.new do |spec|
  spec.name          = "elyan"
  spec.version       = Elyan::VERSION
  spec.authors       = ["David Andersen"]
  spec.email         = ["davidx@gmail.com"]
  spec.summary       = %q{Forge a path to the round table}
  spec.description   = %q{Elyan, son of BORS}
  spec.homepage      = "http://example.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'dust', '~> 0.1', '>= 0.1.6'
  spec.add_development_dependency 'test-unit', '~> 1.2', '>= 1.2.3'
  spec.add_runtime_dependency 'log4r', '~> 1.1', '>= 1.1.10'
  spec.add_runtime_dependency 'octokit', '~> 4.3.0'
  spec.add_runtime_dependency 'ruby-git', '~> 1'
end
