require 'rails_helper'

describe 'the user editing arguments', type: :feature   do 
  before :each do

    @user = user_with_arguments
    visit root_path

  end 

  it "edits argument when edit clickeds" do
	
    click_on 'Sign in'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button ('Log in')
    expect(current_path).to eq(root_path)
    click_on('Arguments')

    expect(current_path).to eq(arguments_path)
    click_on('Edit')

    expect(current_path).to eq(new_argument_path)
  	fill_in 'Title', with: "Something"
    fill_in 'Body', with: "Something"
    click_on('Update Argument')
  
    expect(page).to have_content ("Argument was successfully updated") 
  end

  it "doesn't create new argument when logged in" do
  
    click_on ('Arguments')
    click_on('New Argument')
    expect(page).to have_content ("You need to sign in or sign up before continuing.") 
  end
end

