# frozen_string_literal: true

class Car
  attr_reader :make, :model, :year, :odometer, :price, :description, :date_added

  DEFAULT_YEAR = 0
  DEFAULT_PRICE = 0
  DEFAULT_ODOMETER = 0
  DEFAULT_TYPE_DATE = '%d/%m/%y'

  def initialize(make: '', model: '', year: DEFAULT_YEAR, odometer: DEFAULT_ODOMETER, price: DEFAULT_PRICE, description: '')
    @id = SecureRandom.uuid
    @make = make
    @model = model
    @year = year
    @odometer = odometer
    @price = price
    @description = description
    @date_added = Time.new.strftime(DEFAULT_TYPE_DATE)
  end

  def to_h
    {
      'id' => @id,
      'make' => @make,
      'model' => @model,
      'year' => @year,
      'odometer' => @odometer,
      'price' => @price,
      'description' => @description,
      'data_added' => @date_added
    }
  end
end
