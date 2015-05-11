require 'rails_helper'

feature "Authentication" , :type => :feature do 

  subject { page }

  feature "signin" , :type => :feature do 
    before { visit signin_path }

    feature "with invalid information" , :type => :feature do 
      before { click_button "Sign in" }

      it { should have_selector('title', text: 'Sign in') }
      it { should have_selector('div.alert.alert-error', text: 'Invalid') }

      feature "after visiting another page" , :type => :feature do 
        before { click_link "Home" }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end

    feature "with invalid information" , :type => :feature do 
       let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",    with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Sign in"
      end

      it { should have_selector('title', text: user.name) }
      it { should have_link('Profile', href: user_path(user)) }
      it { should have_link('Sign out', href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }
    end
  end
end
feature "after visiting another page" , :type => :feature do
  before { click_link "Home" }
  it { should_not have_selector('div.alert.alert-error') }
end
feature "followed by signout" , :type => :feature do
        before { click_link "Sign out" }
        it { should have_link('Sign in') }
      end
