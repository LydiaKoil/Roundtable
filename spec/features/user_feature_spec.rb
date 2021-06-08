require 'rails_helper'

describe 'the User', type: :feature do

  before do
  	@user =FactoryBot.create(:user)
  end

  describe 'signs in' do
    before do
      visit '/users/sign_in'
    end

    shared_examples 'throws an error' do
      it 'shows invalid details error' do
        expect(current_path).to eq(new_user_session_path)
        expect(page).to have_text('Invalid Email or password')
      end
    end

    context 'with correct details ' do
      before do
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: @user.password
        click_button ('Log in')
      end

      it 'logs in' do
        expect(current_path).to eq(root_path)
        expect(page).to have_text('Signed in successfully')
        expect(page).to have_text('Sign out')
      end
    end

    context 'with incorrect password' do
      before do
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: '123'
        click_button 'Log in'
      end

      include_examples 'throws an error'
    end

    context 'with incorrect email' do
      before do
        fill_in 'Email', with: 'wrong@'
        fill_in 'Password', with: 'pass'
        click_button 'Log in'
      end

      include_examples 'throws an error'
    end
  end

  describe 'signs up' do
    before do
      visit 'users/sign_up'
    end

    shared_examples 'doesnt create account' do
      it 'doesnt create new account' do
        expect{click_button 'Sign up'}.to change(User, :count).by(0)
        expect(current_path).to eq(user_registration_path)
      end
    end

    context 'with all correct details' do
      before do
        fill_in 'First name',  with: 'Lydia'
        fill_in 'Last name',  with: 'Tk'
        fill_in 'Email', with: 'lydia@gmail.com'
        fill_in 'Password', with: 'password'
        fill_in 'Password confirmation', with: 'password'
      end

      it 'creates account' do
        expect{click_button 'Sign up'}.to change(User, :count).by(1)
        expect(current_path).to eq(root_path)
        expect(page).to have_text('Welcome! You have signed up successfully.')
      end
    end

    context 'with no first and last name' do
      before do
        fill_in 'Email', with: 'lydia@gmail.com'
        fill_in 'Password', with: 'password'
        fill_in 'Password confirmation', with: 'password'
        click_button 'Sign up'
      end

      include_examples 'doesnt create account'

      it 'throws blank error' do
        expect(page).to have_text("First name can't be blank")
        expect(page).to have_text("Last name can't be blank")
      end

    end

    context 'with invalid email' do
      before do
        fill_in 'First name',  with: 'Lydia'
        fill_in 'Last name',  with: 'Tk'
        fill_in 'Email', with: 'invalid_email'
        fill_in 'Password', with: 'password'
        fill_in 'Password confirmation', with: 'pass'
      end

      include_examples 'doesnt create account'
    end

    context 'with invalid password' do
      before do
        fill_in 'First name',  with: 'Lydia'
        fill_in 'Last name',  with: 'Tk'
        fill_in 'Email', with: 'lydia@gmail.com'
        fill_in 'Password', with: 'pass'
        fill_in 'Password confirmation', with: 'pass'
      end

      include_examples 'doesnt create account'
    end

    context 'with password confirmation mismatch' do
      before do
        fill_in 'First name',  with: 'Lydia'
        fill_in 'Last name',  with: 'Tk'
        fill_in 'Email', with: 'lytk@gmail.com'
        fill_in 'Password', with: 'password'
        fill_in 'Password confirmation', with: 'random'
      end

      include_examples 'doesnt create account'
    end
  end
end
