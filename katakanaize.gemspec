# -*- encoding: utf-8 -*-
require File.expand_path('../lib/katakanaize/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Satoshi Namai"]
  gem.email         = ["ainame954@facebook.com"]
  gem.description   = %q{Katakanaize is a rack middleware to convert hiragana to katakana.}
  gem.summary       = %q{Katakanaize is a rack middleware to convert hiragana to katakana.}
  gem.homepage      = "http://github.com/ainame/Katakanaize"
  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "katakanaize"
  gem.require_paths = ["lib"]
  gem.version       = Katakanaize::VERSION
  gem.licenses      = ["MIT"]
end
