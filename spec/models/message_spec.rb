require 'rails_helper'

describe Message do
  it "doesn't save the message if twilio gives an error", :vcr => true do
    message = Message.new(:body => 'hi', :to => '1111111', :from => '5039463641')
    expect(message.save).to be false
  end

  it 'sends to an existing contact', :vcr => true do
    contact = Contact.create(name: 'Anony', number: '+15005550006')
    message = Message.new(:body => 'hi', :to => contact.id, :from => '5039463641')
    expect(message.save).to be true
  end
end
