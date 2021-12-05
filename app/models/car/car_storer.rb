# frozen_string_literal: true

module App
  module Models
    module Car
      class CarStorer
        DB_CARS = ENV.fetch('DB_CARS', 'db.yml')

        class << self
          def save(new_car)
            collection_cars = Controllers::CarController.new.collections_cars

            collection_cars.push(new_car.to_h)
            FileManager.write_to_yaml(file_path: DB_CARS, data: collection_cars)
          end
        end
      end
    end
  end
end
