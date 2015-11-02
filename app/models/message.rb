class Message < ActiveRecord::Base
  before_create :send_message
  has_and_belongs_to_many :contacts

private

  def send_message

    if !self.contacts.any?
      if self.to && self.to.length > 5 # probably a number
        self.contacts = [Contact.create(:name => 'Anonymous', :number => to)]
      else
        self.contacts = [Contact.find(to)]
      end
    end
    self.contacts.each do |contact|
      begin
        response = RestClient::Request.new(
          :method => :post,
          :url => "https://api.twilio.com/2010-04-01/Accounts/#{ENV['TWILIO_ACCOUNT_SID']}/Messages.json",
          :user => ENV['TWILIO_ACCOUNT_SID'],
          :password => ENV['TWILIO_AUTH_TOKEN'],
          :payload => { :Body => body,
                        :To => contact.number,
                        :From => from }
        ).execute
      rescue  RestClient::BadRequest => error
        message = JSON.parse(error.response)['message']
        errors.add(:base, message)
        false
      end
    end
  end
end
