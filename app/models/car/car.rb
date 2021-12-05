# frozen_string_literal: true

module App
  module Models
    module Car
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
  
        class << self
          def collection_of_cars
            FileManager.read_from_yaml(file_path: DB_CARS)
          end
        end
      end
    end
  end
end
