require 'rails_helper'

describe 'the user deleting arguments', type: :feature   do 

  before(:each) do
    @user = user_with_arguments
    visit root_path
  end

  it "deletes argument" do
	  
    click_on 'Sign in'
  	fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button ('Log in')
    expect(current_path).to eq(root_path)
    click_on('Arguments')

    expect(current_path).to eq(arguments_path)
    accept_confirm do
      click_link('Destroy')
    end
        
  end
  
end

