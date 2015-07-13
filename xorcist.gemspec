# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xorcist/version'

Gem::Specification.new do |spec|
  spec.name          = "xorcist"
  spec.version       = Xorcist::VERSION
  spec.authors       = ["Faraz Yashar"]
  spec.email         = ["faraz.yashar@gmail.com"]

  spec.summary       = "Blazing-fast-cross-platform-monkey-patch-free string XOR"
  spec.description   = "Blazing-fast-cross-platform-monkey-patch-free string XOR. Yes, that means JRuby too."
  spec.homepage      = "https://github.com/fny/xorcist"
  spec.license       = "MIT"

  spec.require_paths = ['lib']
  files = %w[README.md] +
          Dir.glob('ext/**/*.{c,java,rb}') +
          Dir.glob('lib/**/*.rb') +
          Dir.glob('test/**/*')

  if RUBY_ENGINE == 'jruby'
    spec.platform = 'java'
    files << 'lib/xorcist.jar'
  else
    spec.extensions = ['ext/xorcist/extconf.rb']
  end

  spec.files = files

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'minitest', '~> 5.7.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rake-compiler'
end
