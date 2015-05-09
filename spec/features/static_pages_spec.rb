require 'rails_helper'

feature "Static pages" , :type => :feature do 

  feature "Home page", :type => :feature do 

    scenario "should have the h1 'Sample App'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Sample App')
    end
    scenario "should have the base title" do
      visit '/static_pages/home'
      page.should have_title('Ruby on Rails Tutorial Sample App')
  end
   scenario "should not have a custom page title" do
      visit '/static_pages/home'
      page.should_not have_title('| Home')
    end
end
  feature "Help page" , :type => :feature do

    scenario "should have the h1 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1', :text => 'Help')
    end
     scenario "should have the title 'Help'" do
      visit '/static_pages/help'
      page.should have_title('Ruby on Rails Tutorial Sample App | Help')
    end
  end
   feature "About page" , :type => :feature do

    scenario "should have the h1 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('h1', :text => 'About Us')
    end
    scenario "should have the title 'About Us'" do
      visit '/static_pages/about'
     page.should have_title('Ruby on Rails Tutorial Sample App | About Us')
    end
  end
end
