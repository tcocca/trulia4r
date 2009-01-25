# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{trulia4r}
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tom Cocca"]
  s.date = %q{2009-01-24}
  s.description = %q{Simple Ruby wrapper for the Trulia API built on HTTParty}
  s.email = %q{tom.cocca@gmail.com}
  s.files = ["lib/trulia4r.rb", "lib/trulia4r/client.rb", "lib/trulia4r/location_info.rb", "lib/trulia4r/trulia_stats.rb", "examples/trulia.rb", "README", "LICENSE", "Rakefile", "VERSION.yml", "tasks/rspec.rake", "spec/rcov.opts", "spec/spec.opts", "spec/spec_helper.rb", "spec/trulia4r/client_spec.rb", "spec/trulia4r/location_info_spec.rb", "spec/trulia4r/trulia_stats_spec.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/tcocca/trulia4r}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Trulia API wrapper for Ruby}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>, [">= 0"])
    else
      s.add_dependency(%q<httparty>, [">= 0"])
    end
  else
    s.add_dependency(%q<httparty>, [">= 0"])
  end
end
