# spec/models/auction_spec.rb

require 'rails_helper'


RSpec.describe Argument, :type => :model do
  
  # user =FactoryBot.create(:user)
  # print user.last_name
  # subject { Argument.new(
  #   title:"Anything",
  #   body: "Anything",
  #   user_id: 1,
  #   created_at: DateTime.now,
  #   reply_type: nil,
  #   argument_id: nil)
  # }

  # it "is valid with valid attributes" do
  #   expect(subject).to be_valid
  # end

  # it "is not valid without a user"do
  #   subject.user_id = nil
  #   expect(subject).to_not be_valid
  # end

  # it "is not valid without a title"do
  #   subject.title = nil
  #   expect(subject).to_not be_valid
  # end

  # describe "Associations" do
  # it { should belong_to(:user).without_validating_presence }
  # end

  subject { create(:argument) }
  it { should belong_to(:user)}
  it { is_expected.to validate_presence_of(:title) }
  

  

end 