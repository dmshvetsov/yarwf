# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yarwf/version'

Gem::Specification.new do |spec|
  spec.name          = "yarwf"
  spec.version       = Yarwf::VERSION
  spec.authors       = ["shvetsovdm"]
  spec.email         = ["sorrows@mail.ru"]

  spec.summary       = %q{Yet another ruby web framework.}
  spec.description   = %q{Yet another ruby web framework, just for fun.}
  spec.homepage      = "https://github.com/shvetsovdm/yarwf.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_runtime_dependency "rack", "~> 1.6"
end
