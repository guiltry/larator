# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'larator/version'

Gem::Specification.new do |spec|
  spec.name          = "larator"
  spec.version       = Larator::VERSION
  spec.authors       = ["Harry Budianto"]
  spec.email         = ["guiltry@gmail.com"]

  spec.summary       = %q{The best way to generate your Laravel code}
  spec.description   = %q{No handcraft-code anymore, having one in your toolbox definitely will increase your productivity}
  spec.homepage      = "https://guiltry.github.io/larator/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", "0.19.1"
  spec.add_dependency "activesupport", "4.2.4"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "3.3.0"
  spec.add_development_dependency "cucumber", "2.1.0"
  spec.add_development_dependency "aruba", "0.9.0"
end
