require 'rails_helper'

RSpec.describe User, type: :model do
  
  subject {User.create(
  first_name: 'Jane',
  last_name: 'Doe',
  email: 'test1@example.com', 
  password: 'password123',
  password_confirmation: 'password123')
  }
  
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without an email"do
    subject.email = nil
    expect(subject).to_not be_valid
  end
  

  it "is not valid without a password"do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  
  

end
