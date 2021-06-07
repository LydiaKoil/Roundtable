require 'rails_helper'

describe 'a user viewing arguments', type: :feature   do 
  before :each do
    @argument_1 = argument_with_pros_cons
  end

  it "displays index of arguments" do

  	visit arguments_path
  	expect(page).to have_content @argument_1.title
    expect(page).to have_content @argument_1.user.full_name

  end

  it "displays individual argument" do

    visit arguments_path
    click_link @argument_1.title
    expect(current_path).to eq("/arguments/#{@argument_1.id}")
    expect(page).to have_content @argument_1.title
    expect(page).to have_content @argument_1.body
    expect(page).to have_content @argument_1.user.full_name
    @argument_1.arguments.pro.each do |arg|
      expect(page).to have_content arg.title
    end
    @argument_1.arguments.con.each do |arg|
      expect(page).to have_content arg.title
  end


      
  end
end