require 'rails_helper'

feature"User pages", :type => :feature do 

  subject { page }

  feature "signup page", :type => :feature do 
    before { visit signup_path }

    scenario { should have_selector('h1',    text: 'Sign up') }
   scenario { should have_title("Sign up") }
  end
end
