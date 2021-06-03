require 'rails_helper'

describe 'Viewing Arguments', type: :feature   do 
  before :each do
  end

  it "displays index with Argument titles " do
    @argument_1 =FactoryBot.create(:argument)
	
  	visit arguments_path
  	expect(page).to have_content @argument_1.title
    expect(page).to have_content @argument_1.user.email.split('@')[0]
    expect(page).to have_content "Show"

  end

  it "displays individual arguments" do
    @argument_1 =FactoryBot.create(:argument)
    visit arguments_path
    click_on "Show"
    expect(current_path).to eq("/arguments/#{@argument_1.id}")
    expect(page).to have_content @argument_1.title
    expect(page).to have_content @argument_1.body
    expect(page).to have_content @argument_1.user.email.split('@')[0]
    expect(page).to have_content @argument_1.user.email.split('@')[0] 
      
  end

  it "displays pros and cons" do
    @argument2 = argument_with_pros_cons
    print @argument2.id
    print @argument2.title
    visit arguments_path
    click_on "Show"
    expect(current_path).to eq("/arguments/#{@argument2.id}")
    expect(page).to have_content @argument2.title
    @argument2.arguments.pro.each do |arg|
      expect(page).to have_content arg.title
    end
    @argument2.arguments.con.each do |arg|
      expect(page).to have_content arg.title
    end
    puts 

  end


=begin
  it "displays argument when show clicked" do
	user =FactoryBot.build(:user)

  	visit arguments_path
  	expect(page).to have_content argument_1.title
    expect(page).to have_content argument_2.title
  end
=end
end