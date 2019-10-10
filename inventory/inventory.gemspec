# frozen_string_literal: true

$:.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'inventory/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'inventory'
  s.version     = Inventory::VERSION
  s.authors     = ['alpine-fury']
  s.email       = ['sean151@gmail.com']
  s.homepage    = ''
  s.summary     = ': Summary of Inventory.'
  s.description = ': Description of Inventory.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*',
                'MIT-LICENSE',
                'Rakefile',
                'README.md']

  s.add_dependency 'rails', '>= 6.0.0'

  s.add_development_dependency 'sqlite3'
end
