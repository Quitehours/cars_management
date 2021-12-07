# frozen_string_literal: true

module App
  module Controllers
    class CarController
      def create(params)
        @car = App::Models::Car::Car.new(**params.slice(:make, :model, :year, :odometer, :price, :description))
      end

      def collection_cars
        @cars = App::Models::Car::Car.new
      end

      def save
        App::Models::Car::CarStorer.save(@car)
      end
    end
  end
end
