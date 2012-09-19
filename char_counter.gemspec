# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'char_counter/version'

Gem::Specification.new do |gem|
  gem.name          = "char_counter"
  gem.version       = CharCounter::VERSION
  gem.authors       = ["shufen Chao"]
  gem.email         = ["shufen.chao@gmail.com"]
  gem.description   = %q{Count input string and display most frequent and least frequent character}
  gem.summary       = %q{Character count}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.require_paths = ["lib"]
end
