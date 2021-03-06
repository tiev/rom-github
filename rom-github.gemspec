
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rom/github/version'

Gem::Specification.new do |spec|
  spec.name          = 'rom-github'
  spec.version       = Rom::Github::VERSION
  spec.authors       = ["Viet (Drake) Tran"]
  spec.email         = ["phuocviet89@gmail.com"]

  spec.summary       = 'Github API HTTP client for ROM'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/tiev/rom-github'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # spec.add_dependency 'rom'
  spec.add_dependency 'rom-http', '>= 0.8.0'

  spec.add_development_dependency 'bundler', '~> 2.1'
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
