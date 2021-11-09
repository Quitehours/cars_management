# frozen_string_literal: true

class CarStorer
  DB_CARS_PATH = ENV['DB_CARS_PATH']

  class << self
    def save(params)
      new_car = Car.new(params)
      list_cars = FileManager.read_from_yaml(file_path: DB_CARS_PATH)

      list_cars.push(new_car)
      FileManager.write_to_yaml(file_path: DB_CARS_PATH, data: list_cars)
    end
  end
end
