# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'railscast/generator/version'

Gem::Specification.new do |spec|
  spec.name          = "railscasts-generator"
  spec.version       = Railscast::Generator::VERSION
  spec.authors       = ["David Tolsma"]
  spec.email         = ["david.tolsma@gmail.com"]
  spec.description   = %q{Apply the Railscasts.com episodes in a generator to apply the concept}
  spec.summary       = %q{Railscasts.com generator of content based on the episodes}
  spec.homepage      = ""
  spec.license       = "MIT"
  
spec.executables   = ['railscasts_generator']
  spec.default_executable = 'railscasts_generator'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "trollop"
end
