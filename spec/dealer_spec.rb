require('rspec')
require('car')
require('dealership')
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
      expect(Car.all().include?(test_car)).to(eq(true))
    end
  end

  describe('.find_car') do
    it('returns a car from @@cars based on car ID number') do
      test_car_1 = Car.new('Lamborghini','Murcielago',2006)
      test_car_2 = Car.new('Ruf','GT3',2004)
      test_car_3 = Car.new('BMW','M3 evo III', 1991)
      expect(Car.find_car(3)).to(eq(test_car_3))
    end
  end

end

describe('Dealership') do

  before() do
    Dealership.clear()
    Car.clear()
  end

  describe('#initialize') do
    it('creates a new dealership with the properties name, city, state') do
      test_dealership = Dealership.new('Powell Motors','Portland','OR')
      expect(test_dealership.name()).to(eq('Powell Motors'))
      expect(test_dealership.city()).to(eq('Portland'))
      expect(test_dealership.state()).to(eq('OR'))
    end
  end

  describe('#add_car') do
    it('creates a new car and adds it to the dealership inventory') do
      test_dealership = Dealership.new('Marr Motors', 'Seattle', 'WA')
      test_car = Car.new('Toyota', 'Camry', 1999)
      test_dealership.add_car(test_car)
      expect(test_dealership.cars().include?(test_car)).to(eq(true))
    end
  end

end
