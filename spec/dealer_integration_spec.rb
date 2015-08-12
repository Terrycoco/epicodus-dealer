require('capybara/rspec')
require('./app.rb')
require('launchy')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

before () do
  Dealership.clear
end

describe('dealer test path', {:type => :feature}) do
 it('serves the index page which will ask the user to input a dealership') do
   visit('/')
   fill_in('name', :with => 'Bob Cars')
   fill_in('city', :with => 'New York')
   fill_in('state', :with => 'NY')
   click_button('Add')
   expect(page).to have_content('Bob Cars')
 end

 it('Creates two dealerships and clicks on one to display a detail page') do
   visit('/')
   fill_in('name', :with => 'Bob Cars')
   fill_in('city', :with => 'New York')
   fill_in('state', :with => 'NY')
   click_button('Add')
   fill_in('name', :with => 'Robert Cars')
   fill_in('city', :with => 'Newark')
   fill_in('state', :with => 'NJ')
   click_button('Add')
   click_link('Robert Cars')
   expect(page).to have_content('Newark')
 end

end
