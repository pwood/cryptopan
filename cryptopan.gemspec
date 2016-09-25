# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cryptopan/version'

Gem::Specification.new do |spec|
  spec.name          = "CryptoPAn"
  spec.version       = CRYPTOPAN_VERSION
  spec.authors       = ["Peter Wood"]
  spec.email         = ["peter@alastria.net"]

  spec.summary       = 'Ruby implementation of Crypto-PAn IP Anonymisation.'
  spec.description   = 'Ruby implementation of Crypto-PAn IP Anonymisation, providing consistency accross prefixes.'
  spec.homepage      = 'http://github.com/pwood/crypto-pan'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "netaddr", "~> 1.5"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
