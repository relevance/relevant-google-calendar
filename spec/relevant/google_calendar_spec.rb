require 'spec_helper'

describe Relevant::GoogleCalendar do
  
  let(:widget) {Relevant::GoogleCalendar.setup(:username => 'foo', :password => 'bob', :calendar => 'My Calendar', :search => 'widget')}
  
  before do
    widget.stubs(:gcal).returns(stub('gcal'))
  end
  
  context '#calendar' do
    it 'finds the calendar using the Google Api' do
      GCal4Ruby::Calendar.expects(:find).with(widget.gcal, :title => 'My Calendar').returns([stub('calendar')])
      widget.calendar
    end
  end
  
  context '#events' do
    it 'calls out to the Google Calendar api' do
      widget.stubs(:calendar).returns(stub('calendar', :id => 123))
      expected_options = {
        'calendar' => 123,
        'start-min' => Date.today.beginning_of_day.utc.xmlschema, 
        'start-max' => 6.days.from_now.end_of_day.utc.xmlschema
      }
      GCal4Ruby::Event.expects(:find).with(widget.gcal, 'widget', expected_options).returns([])
      widget.events
    end
  end
  
  context '#events_happening_on' do
    it 'returns all events happening on a given day' do
      monday_event = stub('event', :start_time => Time.parse('27/09/2010'), :end_time => Time.parse('28/09/2010'))
      wednesday_event = stub('event', :start_time => Time.parse('29/09/2010'), :end_time => Time.parse('30/09/2010'))
      all_week_event = stub('event', :start_time => Time.parse('27/09/2010'), :end_time => Time.parse('02/10/2010'))
      widget.stubs(:events).returns([monday_event, wednesday_event, all_week_event])
      
      events = widget.events_happening_on(Date.parse('29/09/2010'))
      events.should == [wednesday_event, all_week_event]
    end
  end
  
end