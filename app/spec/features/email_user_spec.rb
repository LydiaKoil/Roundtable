require 'rails_helper'

describe "Test sending email with sidekiq", :type => :request do

  it 'send email to sidekiq' do

    user1 = user_with_arguments
    user2 = FactoryBot.create(:user)
    expect{
      UsersMailer.welcome_email(user.id).deliver_later
    }.to change( Sidekiq::Worker.jobs, :size ).by(1)

  end

end
