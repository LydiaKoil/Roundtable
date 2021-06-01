# spec/models/auction_spec.rb

require 'rails_helper'


RSpec.describe Argument, :type => :model do
=begin
  user = User.create(
  first_name: 'Jane',
  last_name: 'Doe',
  email: 'test@example.com', 
  password: 'password123',
  password_confirmation: 'password123'
  )

=end
  let(:user) {
    User.new(:email => "jane@doe.com", :password => "pw1234",  :password_confirmation => "pw1234")
    it { should belong_to(:argument) }
  }
	
  subject { Argument.new(
    title:"Anything",
    body: "Anything",
    user_id: 1,
    created_at: DateTime.now,
    reply_type: nil,
    argument_id: nil)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a user"do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a title"do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  describe "Associations" do
  it { should belong_to(:user).without_validating_presence }
  

  end
  



end 