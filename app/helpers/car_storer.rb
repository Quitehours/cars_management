# frozen_string_literal: true

module Helpers
  class CarStorer
    DB_CARS = ENV.fetch('DB_CARS', 'db.yml')

    def self.save(new_car)
      collection_cars = Controllers::CarController.new.collections_cars

      collection_cars.push(new_car.to_h)
      FileManager.write_to_yaml(file_path: DB_CARS, data: collection_cars)
    end
  end
end
