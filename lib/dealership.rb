class Dealership
  @@dealerships = []

  define_method(:initialize) do | name, city, state |
    @name = name
    @city = city
    @state = state
    @cars = []
  end

  define_method(:name) do
    @name
  end

  define_method(:city) do
    @city
  end

  define_method(:state) do
    @state
  end

  define_singleton_method(:clear) do
    @@dealerships = []
  end

end
