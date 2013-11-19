# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'novaposhta_warehouses/version'

Gem::Specification.new do |spec|
  spec.name          = "novaposhta_warehouses"
  spec.version       = NovaposhtaWarehouses::VERSION
  spec.authors       = ["Sergey Andreyev"]
  spec.email         = ["san.andreyev@gmail.com"]
  spec.description   = %q{List of ukrainian NovaPoshta warehouses}
  spec.summary       = %q{List of ukrainian NovaPoshta warehouses}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency "nokogiri"
end
