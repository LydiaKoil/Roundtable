require 'rails_helper'

describe 'the user creating arguments', type: :feature   do 
  before :each do

    @user =FactoryBot.create(:user)
    visit root_path
    
  end 

  it "creates new argument when logged in" do
	
    click_on 'Sign in'
  	fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button ('Log in')
    expect(current_path).to eq(root_path)
    click_on('New Argument')

    expect(current_path).to eq(new_argument_path)
  	fill_in 'Title', with: "Something"
    fill_in 'Body', with: "Something"
    click_on('Create Argument')
    
    expect(current_path).to eq("/arguments/#{Argument.last.id}")
    expect(page).to have_content ("Argument was successfully created") 
  end

  it "doesn't create new argument when logged in" do
  
    click_on ('Arguments')
    click_on('New Argument')
    
    #expect(current_path).to eq("/arguments/#{Argument.last.id}")
    expect(page).to have_content ("You need to sign in or sign up before continuing.") 
  end



=begin
  it "displays index when logged in" do
	user =FactoryBot.build(:user)
	print user.last_name
	argument_1 =FactoryBot.build(:argument)
	print argument_1.title
	argument_2 =FactoryBot.build(:argument)
  	visit arguments_path
  	expect(page).to have_content argument_1.title
    expect(page).to have_content argument_2.title
  end
=end
end

