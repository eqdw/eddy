# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'eddy/version'

Gem::Specification.new do |spec|
  spec.name          = 'eddy'
  spec.version       = Eddy::VERSION
  spec.authors       = ['James Bobowski', 'Jimmy Qian', 'Tim Herd', 'Ariela Glazek']
  spec.email         = ['james.bobowski@gmail.com', 'jimmyqian@gmail.com', 'rz@eqdw.net', 'ariela.glazek@gmail.com']
  spec.summary       = %q{Ruby Gem for building text-based user interfaces.}
  spec.description   = %q{Ruby Gem for building text-based user interfaces.}
  spec.homepage      = ''
  spec.license       = 'BSD'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake', '10.1.1'
  spec.add_development_dependency 'rspec', '2.14.1'
  spec.add_development_dependency 'pry'
  
  spec.add_dependency 'ncursesw'
  spec.add_dependency 'popen4'
end
