class Car
  @@cars = []
  @@counter = 0

#instance methods
  define_method(:initialize) do | make, model, year |
    @make = make
    @model = model
    @year = year
    @id = Car.create_id()
  end

  define_method(:make) do
    @make
  end

  define_method(:model) do
    @model
  end

  define_method(:year) do
    @year
  end

  define_method(:id) do
    @id
  end

#class methods
  define_singleton_method(:create_id) do
    @@counter += 1
  end

  define_singleton_method(:clear) do
    @@counter = 0
    @@cars = []
  end
end
