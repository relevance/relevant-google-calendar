require "relevant/widget"
require 'gcal4ruby'

module Relevant
  class GoogleCalendar
    Version = "0.0.2"
    include Relevant::Widget
    
    available_options :title => :string, :username => :string, :password => :password, :calendar => :string, :search => :string
    
    refresh_every 10.minutes
    
    template_format :haml
    template %q[
%h2= options[:title].present? ? options[:title] : calendar.title
.google-calendar
  - (Date.today..6.days.from_now.to_date).each do |date|
    - events_for_day = events_happening_on(date)
    - if events_for_day.any?
      %h4
        %span.day= date.day
        = date.to_s(:long_ordinal)
      %ul.google-calendar-events
        - events_for_day.each do |event|
          %li= event.title
:css
  .google-calendar h4 {
    padding-bottom: 0.3em;
    border-bottom: 1px solid #454545;
  }
  .google-calendar span.day {
    display: inline-block;
    padding: 0.2em 0;
    width: 1.5em;
    color: #f0f0f0;
    border: 2px solid #555;
    border-top-width: 4px;
    font-size: 1.3em;
    font-weight: bold;
    text-align: center
  }
  .google-calendar ul.google-calendar-events {
    margin-left: 2em;
  }
]
        
    def gcal
      return @gcal if defined?(@gcal)
      
      @gcal = GCal4Ruby::Service.new
      @gcal.authenticate(options[:username], options[:password])
      @gcal
    end
    
    def calendar
      @calendar ||= GCal4Ruby::Calendar.find(gcal, :title => options[:calendar]).first
    end
    
    def events
      event_options = {'start-min' => Date.today.beginning_of_day.utc.xmlschema, 'start-max' => 6.days.from_now.end_of_day.utc.xmlschema, :calendar => calendar.id}
      @events ||= GCal4Ruby::Event.find(gcal, options[:search], event_options)
    end
    
    def events_happening_on(date)
      events.select {|event| event.start_time.to_date <= date && (event.end_time - 1.minute).to_date >= date}
    end
  end
end

Relevant.register Relevant::GoogleCalendar
