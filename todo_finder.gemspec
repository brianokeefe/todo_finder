# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'todo_finder/version'

Gem::Specification.new do |spec|
  spec.name          = "todo_finder"
  spec.version       = TodoFinder::VERSION
  spec.authors       = ["Brian O'Keefe"]
  spec.email         = ["brian@bokstuff.com"]
  spec.summary       = %q{A simple command line tool for finding TODOs in a codebase and outputting them in a clean, readable way.}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/brianokeefe/todo_finder"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
