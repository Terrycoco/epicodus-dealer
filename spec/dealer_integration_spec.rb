require('capybara/rspec')
require('./app.rb')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('dealer test path', {:type => :feature}) do
 it('serves the index page which will ask the user to input a dealership') do
   visit('/')
   fill_in('name', :with => 'Bob Cars')
   fill_in('city', :with => 'New York')
   fill_in('state', :with => 'NY')
   click_button('Add')
   expect(page).to have_content('Bob Cars')
 end
end
