# spec/models/auction_spec.rb

require 'rails_helper'


RSpec.describe Argument, :type => :model do
  
  subject { create(:argument) }
  it { should belong_to(:user)}
  it { is_expected.to validate_presence_of(:title) }
  
end 