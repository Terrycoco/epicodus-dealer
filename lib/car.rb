class Car
  @@counter = 0

  define_method(:initialize) do | make, model, year |
    @make = make
    @model = model
    @year = year
    @id = create_id()
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

  define_singleton_method(:create_id) do
    @@counter =+ 1
  end

end
