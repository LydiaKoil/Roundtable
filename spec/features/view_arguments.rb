require 'rails_helper'

describe 'a user viewing arguments', type: :feature   do 
  before :each do
    @argument_1 = argument_with_pros_cons
  end

  it "displays index of arguments" do
    #@argument_1 =FactoryBot.create(:argument)
  	visit arguments_path
  	expect(page).to have_content @argument_1.title
    expect(page).to have_content @argument_1.user.email.split('@')[0]

  end

  it "displays individual argument" do
    #@argument_1 =FactoryBot.create(:argument)
    visit arguments_path
    click_link @argument_1.title
    expect(current_path).to eq("/arguments/#{@argument_1.id}")
    expect(page).to have_content @argument_1.title
    expect(page).to have_content @argument_1.body
    expect(page).to have_content @argument_1.user.email.split('@')[0]
    @argument_1.arguments.pro.each do |arg|
      expect(page).to have_content arg.title
    end
    @argument_1.arguments.con.each do |arg|
      expect(page).to have_content arg.title
    end
      
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