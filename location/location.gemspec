$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "location/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "location"
  s.version     = Location::VERSION
  s.authors     = ["alpine-fury"]
  s.email       = ["sean151@gmail.com"]
  s.homepage    = ""
  s.summary     = ": Summary of Location."
  s.description = ": Description of Location."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2.0"

  s.add_development_dependency "sqlite3"
end
