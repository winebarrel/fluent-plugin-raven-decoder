# coding: utf-8
Gem::Specification.new do |spec|
  spec.name          = 'fluent-plugin-raven-decoder'
  spec.version       = '0.1.0'
  spec.authors       = ['Genki Sugawara']
  spec.email         = ['sgwr_dts@yahoo.co.jp']
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = 'https://github.com/winebarrel/fluent-plugin-raven-decoder'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'fluentd'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
end
