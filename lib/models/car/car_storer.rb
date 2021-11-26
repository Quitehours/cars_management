# frozen_string_literal: true

module Models
  module Car
    class CarStorer
      DB_CARS = ENV.fetch('DB_CARS', 'db.yml')

      class << self
        def save(params)
          new_car = Car.new(**params.slice(:make, :model, :year, :odometer, :price, :description))
          list_cars = FileManager.read_from_yaml(file_path: DB_CARS)

          list_cars.push(new_car.to_h)
          FileManager.write_to_yaml(file_path: DB_CARS, data: list_cars)
        end
      end
    end
  end
end
