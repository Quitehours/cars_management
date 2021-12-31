# frozen_string_literal: true

module Models
  class Car
    attr_reader :make, :model, :year, :odometer, :price, :description, :date_added

    DB_CARS = ENV.fetch('DB_CARS', './db/db.yml')
    DEFAULT_TYPE_DATE = '%d/%m/%y'

    def initialize(params)
      @id = SecureRandom.uuid
      @make = params['make']
      @model = params['model']
      @year = params['year']
      @odometer = params['odometer']
      @price = params['price']
      @description = params['description']
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
