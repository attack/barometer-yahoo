# encoding: utf-8
$:.push File.expand_path('../lib', __FILE__)
require 'barometer/yahoo/version'

Gem::Specification.new do |spec|
  spec.name          = 'barometer-yahoo'
  spec.version       = Barometer::Yahoo::VERSION
  spec.authors       = ['Mark Gangl']
  spec.email         = ['mark@attackcorp.com']
  spec.description   = 'A barometer adapter for Yahoo weather'
  spec.summary       = spec.description
  spec.homepage      = 'https://github.com/attack/barometer-yahoo'
  spec.license       = 'MIT'

  spec.platform      = Gem::Platform::RUBY
  spec.required_ruby_version = '>= 1.9.3'

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ['lib']

  spec.add_dependency 'barometer', '~> 0.9.7'
  spec.add_development_dependency 'bundler'
end
