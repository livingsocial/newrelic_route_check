# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'newrelic_route_check/version'

Gem::Specification.new do |spec|
  spec.name          = "newrelic_route_check"
  spec.version       = NewrelicRouteCheck::VERSION
  spec.authors       = ["Dan Mayer"]
  spec.email         = ["dan.mayer@livingsocial.com"]
  spec.description   = %q{Compares New Relic controller_summary.csv to the routes defined in a Rails app}
  spec.summary       = %q{Compares New Relic controller_summary.csv to the routes defined in a Rails app}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
