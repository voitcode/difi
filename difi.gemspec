# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'difi/version'

Gem::Specification.new do |spec|
  spec.name          = "difi"
  spec.version       = Difi::VERSION
  spec.authors       = ["Runar Ingebrigtsen"]
  spec.email         = ["runar@rin.no"]
  spec.description   = %q{Exploit public information from the Norwegian Agency for Public Management and eGovernment (Difi)}
  spec.summary       = %q{Query the Difi API}
  spec.homepage      = "https://github.com/voitmore/difi"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency "faraday"
  spec.add_dependency "excon"
end
