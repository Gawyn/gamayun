require_relative "lib/gamayun/version"

Gem::Specification.new do |spec|
  spec.name        = "gamayun"
  spec.version     = Gamayun::VERSION
  spec.authors     = ["Cristian Planas"]
  spec.email       = ["me@cristianplanas.com"]
  spec.homepage    = "https://github.com/Gawyn/gamayun"
  spec.summary     = "A CMS engine"
  spec.description = "A CMS engine"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Gawyn/gamayun"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.1.1"
  spec.add_dependency "devise", "~> 4.7.3"
  spec.add_dependency "slim-rails", "~> 3.2"
  spec.add_dependency 'simple_form'
end
