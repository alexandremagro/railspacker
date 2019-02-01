$:.push File.expand_path("lib", __dir__)

require "railspacker/version"

Gem::Specification.new do |spec|
  spec.name        = "railspacker"
  spec.version     = Railspacker::VERSION
  spec.authors     = ["Alexandre Magro"]
  spec.email       = ["alexandremagro@live.com"]
  spec.homepage    = "https://github.com/alexandremagro/railspacker"
  spec.summary     = "Railspacker is an alternative to Webpacker"
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
