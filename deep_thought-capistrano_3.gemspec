# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'deep_thought/version'

Gem::Specification.new do |gem|
  gem.name          = "deep_thought-capistrano_3"
  gem.version       = DeepThought::VERSION
  gem.authors       = ["Ian Lollar"]
  gem.email         = ["rhv@redhotvengeance.com"]
  gem.description   = "Deep Thought deployer for 3.0 <= Capistrano."
  gem.summary       = "Deep Thought deployer for 3.0 <= Capistrano."
  gem.homepage      = "https://github.com/redhotvengeance/deep_thought-capistrano_3"

  gem.files         = `git ls-files`.split("\n") - %w[.gitignore]
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "deep_thought", "~>0.1"

  # # testing
  gem.add_development_dependency "minitest", "~>4.7"
  gem.add_development_dependency "mocha", "~>0.14"
  gem.add_development_dependency "database_cleaner", "~>1.2"
  gem.add_development_dependency "turn", "~>0.9"
  gem.add_development_dependency "capistrano", "~>3.0"
end
