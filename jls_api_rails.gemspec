
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jls_api_rails/version"

Gem::Specification.new do |spec|
  spec.name          = "jls_api_rails"
  spec.version       = JlsApiRails::VERSION
  spec.authors       = ["Cihat Gündüz"]
  spec.email         = ["github@cihatguenduez.de"]

  spec.summary       = %q{Simple & flexible JSON request & response formatting standard with built-in sorting & filtering features.}
  spec.description   = %q{Simple & flexible JSON request & response formatting standard with built-in sorting & filtering features.}
  spec.homepage      = "https://github.com/Flinesoft/jls_api_rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end