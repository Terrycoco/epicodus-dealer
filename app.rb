require('sinatra')
require('sinatra/reloader')
require('./lib/car')
require('./lib/dealership')
also_reload('lib/**/*.rb')
require('pry')

get('/') do
  @dealerships = Dealership.all
  erb(:index)
end

post('/new_dealer') do
  name = params.fetch("name")
  city = params.fetch("city")
  state = params.fetch("state")
  Dealership.new(name, city, state).save()
  @dealerships = Dealership.all
  erb(:index)
end

get('/dealership/:name') do
  name = params.fetch('name')
  @dealership = Dealership.find(name)
  erb(:dealership)
end

post('/dealership/:name/new_car') do
  name = params.fetch('name')
  make = params.fetch('make')
  model = params.fetch('model')
  year = params.fetch('year')

  new_car = Car.new(make, model, year)
  @dealership = Dealership.find(name)
  @dealership.add_car(new_car)

  erb(:dealership)
end
