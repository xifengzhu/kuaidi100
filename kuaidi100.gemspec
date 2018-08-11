
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "kuaidi100/version"

Gem::Specification.new do |spec|
  spec.name          = "kuaidi100"
  spec.version       = Kuaidi100::VERSION
  spec.authors       = ["xifengzhu"]
  spec.email         = ["xifengzhu520@gmail.com"]

  spec.summary       = "An unofficial simple kuaidi100 gem"
  spec.description   = "An unofficial simple kuaidi100 gem"
  spec.homepage      = "https://github.com/xifengzhu/kuaidi100"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.require_paths = ["lib"]

  spec.add_development_dependency "httparty", '~> 0.15'
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5"
  spec.add_development_dependency "webmock", '~> 2.3'
end
