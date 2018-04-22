
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jls_api/version"

Gem::Specification.new do |spec|
  spec.name          = "jls_api_rails"
  spec.version       = JlsApi::VERSION
  spec.authors       = ["Cihat Gündüz"]
  spec.email         = ["github@cihatguenduez.de"]

  spec.summary       = %q{Easy to use JLS:API server framework for Ruby on Rails backends.}
  spec.description   = %q{Easy to use JLS:API server framework for Ruby on Rails backends.}
  spec.homepage      = "https://github.com/Flinesoft/jls_api_rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "actionpack", "~> 5.2"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry-byebug", "~> 3.6"
  spec.add_development_dependency "json_expressions", "~> 0.9"
end
