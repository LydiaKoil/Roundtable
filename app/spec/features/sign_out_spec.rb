require 'rails_helper'

describe 'the user signing out', type: :feature do

  before(:each) do
  	@user =FactoryBot.create(:user)
  	visit '/users/sign_in'
  end

  it 'signs user out' do
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_on ('Log in')
    expect(current_path).to eq(root_path)
    expect(page).to have_text('Signed in successfully')
    click_on ('Sign out')
    expect(page).to have_text('Signed out successfully')

   end
end