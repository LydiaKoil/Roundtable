require 'rails_helper'

describe 'User sees Arguments', type: :feature   do  

  it "displays index" do
  	user =FactoryBot.build(:user)

  	argument_1 = Argument.create(
    title:'Anything',
    body: 'Anything',
    user_id: 1,
    created_at: DateTime.now,
    reply_type: nil,
    argument_id: nil)

    argument_2 = Argument.create(
    title:'Something else',
    body: 'Something else',
    user_id: 1,
    created_at: DateTime.now,
    reply_type: nil,
    argument_id: nil)

  	visit arguments_path
  	expect(page).to have_content 'Anything'
    expect(page).to have_content 'Something else'   
  end
end

