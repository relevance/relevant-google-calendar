# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{relevant-google-calendar}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jared Pace"]
  s.date = %q{2010-09-29}
  s.description = %q{Show upcoming events}
  s.email = %q{opensource@thinkrelevance.com}
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.files = [
    "lib/relevant/google_calendar.rb",
     "spec/relevant/google_calendar_spec.rb",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/relevance/relevant-google-calendar}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{GoogleCalendar widget for Relevant}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<relevant-widget>, ["~> 0.0.6"])
      s.add_runtime_dependency(%q<gcal4ruby>, ["~> 0.5.5"])
      s.add_development_dependency(%q<rspec>, ["~> 2.0.0.beta.22"])
    else
      s.add_dependency(%q<relevant-widget>, ["~> 0.0.6"])
      s.add_dependency(%q<gcal4ruby>, ["~> 0.5.5"])
      s.add_dependency(%q<rspec>, ["~> 2.0.0.beta.22"])
    end
  else
    s.add_dependency(%q<relevant-widget>, ["~> 0.0.6"])
    s.add_dependency(%q<gcal4ruby>, ["~> 0.5.5"])
    s.add_dependency(%q<rspec>, ["~> 2.0.0.beta.22"])
  end
end

