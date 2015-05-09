require 'rails_helper'

feature "Static pages" , :type => :feature do 
  subject {page}

  feature "Home page", :type => :feature do 
    before { visit root_path}

    scenario { should have_selector('h1',    text: 'Sample App') }
    scenario { should have_title("Ruby on Rails Tutorial Sample App") }
    scenario { should_not have_selector 'title', text: '| Home' }
    end
   feature "Help page", :type => :feature do 
    before { visit help_path }

    scenario { should have_selector('h1',    text: 'Help') }
    scenario { should have_title("Ruby on Rails Tutorial Sample App | Help" ) }
  end

  feature "About page", :type => :feature do 
    before { visit about_path }

   scenario { should have_selector('h1',    text: 'About') }
    scenario { should have_title("Ruby on Rails Tutorial Sample App | About Us") }
  end
     feature "Contact page" do
      before { visit contact_path }
      
    scenario { should have_selector('h1', text: 'Contact') }
    scenario { should have_title("Ruby on Rails Tutorial Sample App | Contact") }
    end
  end
