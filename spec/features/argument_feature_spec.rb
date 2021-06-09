require 'rails_helper'

describe 'An Argument', type: :feature  do 

	before do
	    @user = user_with_arguments
	    visit root_path
  end 

  describe "show" do
    before do
      @argument = argument_with_pros_cons
      visit arguments_path
      click_link @argument.title
    end
    
    it "shows individual argument" do  
      expect(current_path).to eq("/arguments/#{@argument.id}")
      expect(page).to have_content @argument.title
      expect(page).to have_content @argument.body
      expect(page).to have_content @argument.user.full_name
      @argument.arguments.pro.each do |arg|
        expect(page).to have_content arg.title
      end
      @argument.arguments.con.each do |arg|
        expect(page).to have_content arg.title
      end
    end
  end

  describe "new" do 
    context "when logged in" do
      before do
        click_on 'Sign in'
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: @user.password
        click_button ('Log in')
        click_on('New Argument')
      end

      it "displays new argument form" do   
        expect(current_path).to eq(new_argument_path)
        expect(page).to have_selector(:link_or_button, 'Create Argument')
      end
    end

    context "when logged out" do
      before do
        click_on('Arguments')
        click_on('New Argument')
      end

      it "doesnt display argument form " do
        expect(page).to_not have_selector(:link_or_button, 'Create Argument')
        expect(page).to have_content ("You need to sign in or sign up before continuing.") 
      end
    end
  end
  

	describe "create" do
    before do
      click_on 'Sign in'
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button ('Log in')
      click_on('New Argument')
      
    end

		context "when full details are provided" do
      before do
        fill_in 'Title', with: "Something"
        fill_in 'Body', with: "Something"
        click_on('Create Argument')
      end
	    it "creates a new argument" do			    
		    expect(current_path).to eq("/arguments/#{Argument.last.id}")
		    expect(page).to have_content ("Argument was successfully created")
	    end
		end

		context "when title not given" do
      before do
        fill_in 'Title', with: nil
        fill_in 'Body', with: "Something"
        click_on('Create Argument')
      end

			it "does not allow argument creation" do
    		expect(page).to have_content ("Title can't be blank") 
	   	end
		end
  end

	describe "edit" do
    shared_examples 'doesnt show edit functionality' do
      it 'shows no edit button' do
        click_on ('Arguments')
        expect(page).to_not have_content ("Edit")
      end
    end

		context "when author logged in" do
			before do
	      click_on 'Sign in'
		    fill_in 'Email', with: @user.email
		    fill_in 'Password', with: @user.password
		    click_button ('Log in')
		    click_on('Arguments')
		      
	  	end

      it "displays edit button" do
        expect(page).to have_selector(:link_or_button, 'Edit')
      end

	    it "display edit form" do
        click_on('Edit') 			    
        expect(page).to have_selector(:link_or_button, 'Update Argument')
	    end
		end

		context "when author logged out" do
			include_examples 'doesnt show edit functionality'
		end

    context "when non-author logged in" do
      before do
        @user2 =FactoryBot.create(:user)
        click_on 'Sign in'
        fill_in 'Email', with: @user2.email
        fill_in 'Password', with: @user2.password
        click_button ('Log in')
      end

      include_examples 'doesnt show edit functionality'
    end 
	end

  describe "update" do
    before do
      click_on 'Sign in'
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button ('Log in')
      click_on('Arguments')
      click_on('Edit')
    end

    context "when full details are provided" do
      before do
        fill_in 'Title', with: "Something"
        fill_in 'Body', with: "Something"
        click_on('Update Argument')   
      end

      it "updates argument" do          
        expect(page).to have_content ("Argument was successfully updated")
      end
    end

    context "when title not given" do
      before do
        fill_in 'Title', with: nil
        fill_in 'Body', with: "Something"
        click_on('Update Argument')
      end

      it "does not update argument" do
        expect(page).to have_content ("Title can't be blank") 
      end
    end

  end
	describe "delete",  :js => true do

    shared_examples 'doesnt show delete functionality' do
     it 'shows no delet button' do
        click_on ('Arguments')
        expect(page).to_not have_content ("Delete")
     end
    end

    context "when logged in" do
      before do
        click_on 'Sign in'
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: @user.password
        click_button ('Log in')
        click_on('Arguments')
        click_link('Destroy')
        accept_confirm("Are you sure?")   
      end

      it "deletes argument" do
        expect(page).to have_content ("Argument was successfully destroyed")
      end
    end
    
    context "when logged out" do
      include_examples 'doesnt show delete functionality'
    end

    context "when non-author logged in" do
      before do
        @user2 =FactoryBot.create(:user)
        click_on 'Sign in'
        fill_in 'Email', with: @user2.email
        fill_in 'Password', with: @user2.password
        click_button ('Log in')
      end

      include_examples 'doesnt show delete functionality'
    end 


  end
end