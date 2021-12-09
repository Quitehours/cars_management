# frozen_string_literal: true

module Services
  module Stores
    class CarStore
      DB_CARS = ENV.fetch('DB_CARS', 'db.yml')

      def self.save(new_car)
        collection_cars = FileManager.read_from_yaml(file_path: DB_CARS)

        collection_cars.push(new_car.to_h)
        FileManager.write_to_yaml(file_path: DB_CARS, data: collection_cars)
      end
    end
  end
end
