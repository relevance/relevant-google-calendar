require 'rake'
require File.dirname(__FILE__) + "/lib/relevant/google_calendar.rb"

require 'rspec/core/rake_task'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.version = Relevant::GoogleCalendar::Version
    gemspec.name = "relevant-google-calendar"
    gemspec.summary = "GoogleCalendar widget for Relevant"
    gemspec.description = "Show upcoming events"
    gemspec.email = "opensource@thinkrelevance.com"
    gemspec.homepage = "http://github.com/relevance/relevant-google-calendar"
    gemspec.authors = ["Jared Pace"]
    gemspec.add_dependency "relevant-widget", "~> 0.0.6"
    gemspec.add_dependency "gcal4ruby", "~> 0.5.5"
    gemspec.add_development_dependency "rspec", "~> 2.0.0.beta.22"
    gemspec.files = Dir.glob('**/*.rb')
  end
  Jeweler::GemcutterTasks.new
  
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)
task :default => :spec

task :full_release => [:check_dependencies, :spec, :release]