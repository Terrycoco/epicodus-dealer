class Car
  define_method(:initialize) do | make, model, year |
    @make = make
    @model = model
    @year = year
    @id = 1
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
end
