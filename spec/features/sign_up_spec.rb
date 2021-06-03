require 'rails_helper'

describe 'the sign up process', type: :feature do
  before :each do
    visit 'users/sign_up'
  end

  it 'creates a new user when given all fields' do

  	fill_in 'First name',  with: 'Lydia'
  	fill_in 'Last name',  with: 'Tk'
    fill_in 'Email', with: 'lydia@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'   
    expect{
      click_button 'Sign up'
    }.to change(User, :count).by(1)
    expect(current_path).to eq(root_path)
    expect(page).to have_text('Welcome! You have signed up successfully.')
  end

  it "doesn't create user without first and last name" do

    fill_in 'Email', with: 'lydia@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    expect{
      click_button 'Sign up'
    }.to change(User, :count).by(0)
    expect(page).to have_text("First name can't be blank")
   	expect(page).to have_text("Last name can't be blank")
    expect(current_path).to eq(user_registration_path)
  end


  it "doesn't create user if email is invalid" do

  	fill_in 'First name',  with: 'Lydia'
  	fill_in 'Last name',  with: 'Tk'
    fill_in 'Email', with: 'invalid_email'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'pass'
    expect{
      click_button 'Sign up'
    }.to change(User, :count).by(0)
    expect(current_path).to eq(user_registration_path)
    expect(page).to have_text('Email is invalid')
  end

  it "doesn't create user if password is invalid" do

  	fill_in 'First name',  with: 'Lydia'
  	fill_in 'Last name',  with: 'Tk'
    fill_in 'Email', with: 'invalid_email'
    fill_in 'Password', with: 'pass'
    fill_in 'Password confirmation', with: 'pass'
    expect{
      click_button 'Sign up'
    }.to change(User, :count).by(0)
    expect(current_path).to eq(user_registration_path)
    expect(page).to have_text('Password is too short')
  end


  it "doesn't create user if passwords don't match" do

  	fill_in 'First name',  with: 'Lydia'
  	fill_in 'Last name',  with: 'Tk'
    fill_in 'Email', with: 'lytk@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'random'
    expect{
      click_button 'Sign up'
    }.to change(User, :count).by(0)
    expect(current_path).to eq(user_registration_path)
    expect(page).to have_text("Password confirmation doesn't match Password")
  end

end