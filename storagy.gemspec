# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'storagy/version'

Gem::Specification.new do |spec|
  spec.name          = "storagy"
  spec.version       = Storagy::VERSION
  spec.authors       = ["Nikolay Samokhin"]
  spec.email         = ["nsamokhin@aligntech.com"]
  spec.summary       = %q{Configure your app with Storagy bucket automatically}
  spec.description   = %q{This gem provides useful methods and API wrappers}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
