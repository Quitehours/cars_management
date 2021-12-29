# frozen_string_literal: true

module Models
  class Car
    attr_reader :make, :model, :year, :odometer, :price, :description, :date_added

    DB_CARS = ENV.fetch('DB_CARS', 'db.yml')
    DEFAULT_TYPE_DATE = '%d/%m/%y'

    def initialize(make:, model:, year:, odometer:, price:, description: '')
      @id = SecureRandom.uuid
      @make = make
      @model = model
      @year = year
      @odometer = odometer
      @price = price
      @description = description
      @date_added = Time.now.to_i
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
        'date_added' => @date_added
      }
    end
  end
end
