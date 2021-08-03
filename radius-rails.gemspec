# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'radius/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "radius-rails"
  spec.version       = Radius::Rails::VERSION
  spec.authors       = ["Christopher Sexton"]
  spec.email         = ["chris@radiusnetworks.com"]
  spec.summary       = %q{Radius Networks Rails Assets and Generators}
  spec.description   = ""
  spec.homepage      = "https://github.com/RadiusNetworks/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  #spec.add_dependency "font-awesome-rails"
  spec.add_dependency "railties", ">= 3.2", "<= 6.0"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 12.3.3"
  spec.add_development_dependency "activesupport"
  spec.add_development_dependency "sass-rails"
end
