
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "bookfind/version"

Gem::Specification.new do |spec|
  spec.name          = "scifibookfind"
  spec.version       = Bookfind::VERSION
  spec.authors       = ["'Lamia Haider'"]
  spec.email         = ["'lamia.haider@gmail.com'"]
  spec.executables = ["bookfind"]
  spec.files       = ["lib/bookfind.rb", "lib/bookfind/cli.rb", "lib/bookfind/scraper.rb", "lib/bookfind/books.rb"]
  spec.description   = "Randomly selects a science fiction novel title and provides further details."
  spec.license       = "MIT"
  spec.summary = "The Scientific Anecdotes and Stories Suggestion Interface"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", ">= 0"
  spec.add_development_dependency "nokogiri", ">= 0"
  spec.add_development_dependency "pry", ">= 0"
  spec.add_development_dependency "pry-nav"
end
