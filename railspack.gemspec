$:.push File.expand_path("lib", __dir__)

require "railspack/version"

Gem::Specification.new do |spec|
  spec.name        = "railspack"
  spec.version     = Railspack::VERSION
  spec.authors     = ["Alexandre Magro"]
  spec.email       = ["alexandremagro@live.com"]
  spec.homepage    = "https://github.com/alexandremagro/railspack"
  spec.summary     = "Railspack is an alternative to Webpacker"
  spec.license     = "MIT"
  spec.files       = Dir[
    "{bin,lib}/**/*",
    "MIT-LICENSE",
    "Rakefile",
    "README.md"
  ]
  spec.add_dependency "rails", "~> 5.1"
  spec.add_development_dependency "sqlite3"
end
