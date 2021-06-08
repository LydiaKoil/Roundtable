require 'rails_helper'

describe 'An Argument', type: :feature  do 

	before do
	    @user = user_with_arguments
	    visit root_path
  end 

  describe "show" do
    before do
      argument = argument_with_pros_cons
      visit arguments_path
      click_link argument.title
    end
    
    it "shows individual argument" do  
      expect(current_path).to eq("/arguments/#{argument.id}")
      expect(page).to have_content argument.title
      expect(page).to have_content argument.body
      expect(page).to have_content argument.user.full_name
      argument.arguments.pro.each do |arg|
        expect(page).to have_content arg.title
      end
      argument.arguments.con.each do |arg|
        expect(page).to have_content arg.title
      end
    end
  end

	describe "create" do 
		context "when logged in" do
			before do
	      click_on 'Sign in'
			  fill_in 'Email', with: @user.email
			  fill_in 'Password', with: @user.password
			  click_button ('Log in')
			  click_on('New Argument')
			  fill_in 'Title', with: "Something"
			  fill_in 'Body', with: "Something"
			  click_on('Create Argument')
	    end

	    it "creates a new argument" do			    
		    expect(current_path).to eq("/arguments/#{Argument.last.id}")
		    expect(page).to have_content ("Argument was successfully created")
	    end
		end

		context "when logged out" do
			it "does not allow argument creation" do
	    	click_on ('Arguments')
    		click_on('New Argument')
    		expect(page).to have_content ("You need to sign in or sign up before continuing.") 
	   	end
		end
  end

	describe "edit" do
		context "when logged in" do
			before do
	      click_on 'Sign in'
		    fill_in 'Email', with: @user.email
		    fill_in 'Password', with: @user.password
		    click_button ('Log in')
		    click_on('Arguments')
		    click_on('Edit')
		  	fill_in 'Title', with: "Something"
		    fill_in 'Body', with: "Something"
		    click_on('Update Argument')   
	  	end

	    it "updates argument" do			    
		    expect(page).to have_content ("Argument was successfully updated")
	    end
		end

		context "when logged out" do
			it "does not show editing functionality" do
	    	click_on ('Arguments')
  			expect(page).to_not have_content ("Edit")
	   	end
		end	
	end

	describe "delete",  :js => true do
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
      it "doesn't show delete functionality" do
        click_on ('Arguments')
        expect(page).to_not have_content ("Delete")
      end
    end
  end
end