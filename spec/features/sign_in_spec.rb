require 'rails_helper'

describe 'the signin_process', type: :feature do

  before(:each) do
  	@user =FactoryBot.create(:user)
  	visit '/users/sign_in'
  end

  it 'signs user in' do
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button ('Log in')
    expect(current_path).to eq(root_path)
    expect(page).to have_text('Signed in successfully')
    expect(page).to have_text('Sign out')
   end

  it 'throws error if password invalid' do
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: '123'
    click_button 'Log in'
    expect(current_path).to eq(new_user_session_path)
    expect(page).to have_text('Invalid Email or password')
  end

  it 'throws error if email is invalid' do
    fill_in 'Email', with: 'wrong@'
    fill_in 'Password', with: 'pass'
    click_button 'Log in'
    expect(current_path).to eq(new_user_session_path)
    expect(page).to have_text('Invalid Email or password')
  end

end