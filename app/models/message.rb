class Message < ActiveRecord::Base
  validates :to, presence: true
  validates :from, presence: true
  validates :body, presence: true

  before_create :send_sms

  private

  def send_sms
    begin
      response = RestClient::Request.new(
        :method => :post,
        :url => 'https://@api.twilio.com/2010-04-01/Accounts/ACfbd6e240902d8750b0d492eb558ecafc/Messages.json',
        :user => ENV['TWILIO_ACCOUNT_SID'],
        :password => ENV['TWILIO_AUTH_TOKEN'],
        :payload => { :To => to,
                      :From => from,
                      :Body => body }
      ).execute
    rescue
      false
    end
  end
end
