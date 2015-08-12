require('capybara/rspec')
require('./app.rb')
require('launchy')
require('pry')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('dealer test path', {:type => :feature}) do
  before () do
    Dealership.clear
  end

 it('serves the index page which will ask the user to input a dealership') do
   visit('/')
   fill_in('name', :with => 'Terry')
   fill_in('city', :with => 'New York')
   fill_in('state', :with => 'NY')
   click_button('Add')
   expect(page).to have_content('Terry')
 end

 it('Creates two dealerships and clicks on one to display a detail page') do
   visit('/')
   fill_in('name', :with => 'Bob')
   fill_in('city', :with => 'New York')
   fill_in('state', :with => 'NY')
   click_button('Add')
   fill_in('name', :with => 'Robert')
   fill_in('city', :with => 'Newark')
   fill_in('state', :with => 'NJ')
   click_button('Add')

   click_link('Robert')

   expect(page).to have_content('Newark')
 end

 it('displays the list of cars the dealership has and gives user the ability to add a car') do
   visit('/')
   fill_in('name', :with => 'Bob')
   fill_in('city', :with => 'New York')
   fill_in('state', :with => 'NY')
   click_button('Add')
   fill_in('name', :with => 'Robert')
   fill_in('city', :with => 'Newark')
   fill_in('state', :with => 'NJ')
   click_button('Add')

   click_link('Robert')
   fill_in('make', :with => 'Toyota')
   fill_in('model', :with => 'Celica')
   fill_in('year', :with => 1999)
   click_button('Add car')
   expect(page).to have_content('Celica') 
   end

end
