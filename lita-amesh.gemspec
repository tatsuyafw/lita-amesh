# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "lita-amesh"
  spec.version       = "0.1.1"
  spec.authors       = ["Tatsuya Hoshino"]
  spec.email         = ["tatsuya7.hoshino7@gmail.com"]
  spec.description   = %q{A Lita handler for displaying an image of Tokyo amesh.}
  spec.summary       = %q{A Lita handler for displaying an image of Tokyo amesh.}
  spec.homepage      = "https://github.com/tatsuyafw/lita-amesh"
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 4.7"
  spec.add_runtime_dependency "slack-ruby-client"
  spec.add_runtime_dependency "mini_magick"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rspec", ">= 3.0.0"
  spec.add_development_dependency "rspec_junit_formatter"
end
