require 'spec_helper'

describe Message do
  it { should validate_presence_of :to }
  it { should validate_presence_of :from }
  it { should validate_presence_of :body }

  it "dosen't save the message if twilio gives an error" do
    message = Message.new(:body => 'howdy', :to => '111111', :from => '7754730713')
    message.save.should be_false
  end
end
