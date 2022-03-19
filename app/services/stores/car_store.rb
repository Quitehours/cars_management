# frozen_string_literal: true

module Services
  module Stores
    class CarStore
      def self.save(new_car)
        collection_cars = Repositories::CarRepository.all

        collection_cars.push(new_car.to_h)
        Repositories::CarRepository.save(collection_cars)
      end
    end
  end
end
