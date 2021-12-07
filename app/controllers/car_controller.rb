# frozen_string_literal: true

module Controllers
  class CarController
    def create(params)
      @car = Models::Car::Car.new(**params.slice(:make, :model, :year, :odometer, :price, :description))
    end

    def collection_cars
      @cars = Models::Car::Car.new
    end

    def save
      Models::Car::CarStorer.save(@car)
    end
  end
end
