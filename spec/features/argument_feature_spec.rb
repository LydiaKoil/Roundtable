require 'rails_helper'

describe 'An Argument', type: :feature  do 

	before :each do
	    @user = user_with_arguments
	    visit root_path
  end 

    describe ".show" do

      it "shows index" do
        visit arguments_path
        argument_1 = @user.arguments.first
        expect(page).to have_content argument_1.title
        expect(page).to have_content argument_1.user.full_name
      end

      it "shows individual argument" do
        @argument_1 = argument_with_pros_cons
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

  	describe ".create" do 
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


  	describe ".edit" do
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

  	describe ".delete",  :js => true do
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


 #    context "When unauthorised user is logged in" do

 #    	before(:context) do

	#     	user2 =FactoryBot.create(:user)
	#     	visit root_path
	#     	click_on 'Sign in'
	# 	  	fill_in 'Email', with: user2.email
	# 	    fill_in 'Password', with: user2.password
	# 	    click_button ('Log in')
	# 	    click_on('Arguments')
	#     end

	#     it "doesn't show editing" do
	#     	click_on ('Arguments')
 #    		expect(page).to_not have_content ("Edit")
 #    	end

 #    	it "doesn't show deleting" do
	#     	click_on ('Arguments')
 #    		expect(page).to_not have_content ("Delete")
 #    	end

	# end
  
