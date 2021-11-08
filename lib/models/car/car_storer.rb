# frozen_string_literal: true

class CarStorer
  DB_CARS_PATH = ENV['DB_CARS_PATH']

  class << self
    def save(params)
      car = Car.new(make: params[:make], model: params[:model], year: params[:year], odometer: params[:odometer],
      price: params[:price], description: params[:description])
      list_cars = FileManager.read_from_yaml(path: DB_CARS_PATH)

      list_cars.push(car)
      FileManager.write_to_yaml(path: DB_CARS_PATH, data: list_cars)
    end
  end
end
