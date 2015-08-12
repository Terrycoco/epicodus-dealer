require('sinatra')
require('sinatra/reloader')
require('./lib/car')
require('./lib/dealership')
also_reload('lib/**/*.rb')

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
