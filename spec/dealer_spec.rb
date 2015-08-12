require('rspec')
require('car')
require('pry')

describe('Car') do

  before() do
    Car.clear()
  end

  describe('#initialize') do
    it('create a new car with properties make, model, year, id') do
      test_car = Car.new('Toyota', 'Celica', 2000)
      expect(test_car.model()).to(eq('Celica'))
    end
  end

  describe('.create_id') do
    it('generates a unique number based on the number of cars already initialized') do
      Car.new('Ferrari', 'LaFerrari', 2014)
      test_car = Car.new('Mercedes', 'S55 AMG', 2016)

      expect(test_car.id()).to(eq(2))
    end
  end

  describe('.save') do
    it('saves a vehicle to a collection') do
      test_car = Car.new('Ford','Ranger', 2001)
      test_car.save()
      expect(Car.all().include?(test_car)).to(eq(true))
    end
  end

end
