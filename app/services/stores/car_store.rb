# frozen_string_literal: true

module Services
  module Stores
    class CarStore
      def self.save(new_car)
        collection_cars = Helpers::FileManagerHelper.read_from_yaml(file_path: DB_CARS)

        collection_cars.push(new_car.to_h)
        Helpers::FileManagerHelper.write_to_yaml(file_path: Models::Car::DB_CARS, data: collection_cars)
      end
    end
  end
end
