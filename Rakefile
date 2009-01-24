require 'rake'
require 'rake/rdoctask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "trulia4r"
    s.summary = %Q{Trulia API wrapper for Ruby}
    s.email = "tom.cocca@gmail.com"
    s.homepage = "http://github.com/tcocca/trulia4r"
    s.description = "Simple Ruby wrapper for the Trulia API built on HTTParty"
    s.files = [
      "lib/trulia4r.rb",
      "lib/trulia4r/client.rb",
      "lib/trulia4r/location_info.rb",
      "lib/trulia4r/trulia_stats.rb",
      "examples/trulia.rb",
      "README",
      "LICENSE",
      "Rakefile",
      "VERSION.yml",
      "tasks/rspec.rake",
      "spec/rcov.opts",
      "spec/spec.opts",
      "spec/spec_helper.rb",
      "spec/trulia4r/client_spec.rb",
      "spec/trulia4r/location_info_spec.rb",
      "spec/trulia4r/trulia_stats_spec.rb"
    ]
    s.authors = ["Tom Cocca"]
    s.add_dependency 'httparty'
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'trulia4r'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

Dir['tasks/**/*.rake'].each { |t| load t }

task :default => :spec
