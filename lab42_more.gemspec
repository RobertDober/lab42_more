require_relative 'lib/lab42/more/version'

version = Lab42::More::VERSION

Gem::Specification.new do |s|
  s.name        = 'lab42_more'
  s.version     = version
  s.summary     = 'Lab42 Core Extensions and More'
  s.description = %{Unification of Enumerable API, Datastructures}
  s.authors     = ["Robert Dober"]
  s.email       = 'robert.dober@gmail.com'
  s.files       = Dir.glob("lib/**/*.rb")
  # s.files      += Dir.glob("bin/*")
  s.bindir      = "bin"
  s.files      += %w{LICENSE README.md}
  s.executables = Dir.glob("bin/*").map{ |f| f.sub(%r{bin/},"") }
  s.homepage    = "https://github.com/RobertDober/lab42_more"
  s.licenses    = %w{MIT}

  s.required_ruby_version = '>= 2.1'
  # s.add_dependency 'lab42_options', '~> 0.4'
  # s.add_dependency 'lab42_core', '~> 0.0.6'
  # s.add_dependency 'forwarder2', '~> 0.2'

  s.add_development_dependency 'pry', '~> 0.10'
  s.add_development_dependency 'pry-nav', '~> 0.2'
  s.add_development_dependency 'rspec', '~> 3.0'
  s.add_development_dependency 'qed', '~> 2.9'
  s.add_development_dependency 'ae', '~> 1.8'
end
