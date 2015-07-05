# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'maui_support/version'

Gem::Specification.new do |spec|
  spec.name          = "maui_support"
  spec.version       = MauiSupport::VERSION
  spec.authors       = ["Justin Gordon"]
  spec.email         = ["justin.gordon@gmail.com"]
  spec.summary       = %q{RailsOnMaui Utility Methods}
  spec.description   = %q{Includes white_list_params}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", "~> 4.2"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.3"
end
