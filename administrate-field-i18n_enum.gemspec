# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "administrate-field-i18n_enum"
  spec.version       = '0.1.5'
  spec.authors       = ["iwasaki_d"]
  spec.email         = ["d.iwasaki.g@gmail.com"]

  spec.summary       = "A plugin to i18n enum attribute select box in Administrate."
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/iwasaki-d/administrate-i18n-enum"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split("\n")
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'administrate'
  spec.add_runtime_dependency 'rails', '>= 4.2'
end
