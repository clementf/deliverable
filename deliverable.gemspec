require_paths = ["lib"]
require_paths.each do |require_path|
  $LOAD_PATH.push File.expand_path(require_path, __dir__)
end

require "deliverable/version"

Gem::Specification.new do |spec|
  spec.name        = "deliverable"
  spec.version     = Deliverable::VERSION
  spec.summary     = "Deliverable keeps track of email opens and clicks in your Ruby on Rails app"

  spec.license     = "MIT"
  spec.authors     = ["Clément Férey"]
  spec.email       = ["clement.ferey@gmail.com"]
  spec.homepage    = "https://github.com/clementf/deliverable"
  spec.metadata = {
    "bug_tracker_uri"       => "https://github.com/clementf/deliverable/issues",
    "changelog_uri"         => "https://github.com/clementf/deliverable/blob/master/CHANGELOG.md",
    "homepage_uri"          => spec.homepage,
    "source_code_uri"       => "https://github.com/clementf/deliverable",
    "rubygems_mfa_required" => "true",
  }

  spec.files = Dir[
    "lib/**/*",
    "README.md",
    "CHANGELOG.md",
    "LICENSE",
  ]
  spec.require_paths = require_paths
  spec.bindir = "exe"

  spec.extra_rdoc_files = Dir["README.md", "CHANGELOG.md", "LICENSE"]
  spec.rdoc_options += [
    "--title", "Deliverable keeps track of email opens and clicks in your Ruby on Rails app",
    "--main", "README.md",
    "--line-numbers",
    "--inline-source",
    "--quiet"
  ]

  spec.required_ruby_version = ">= 2.5.0"

  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "yard"
end

