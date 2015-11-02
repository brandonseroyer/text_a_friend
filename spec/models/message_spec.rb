require 'rails_helper'

describe Message do
  it "doesn't save the message if twilio gives an error", :vcr => true do
    message = Message.new(:body => 'hi', :to => '1111111', :from => '5039463641')
    expect(message.save).to be false
  end
end
