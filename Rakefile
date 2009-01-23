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
