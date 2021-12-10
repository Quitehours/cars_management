# frozen_string_literal: true

module Controllers
  class CarsController
    def create(params)
      car = Models::Car.new(**params.slice(:make, :model, :year, :odometer, :price, :description))
      Services::Stores::CarStorer.save(car)
    end

    def index(params = {})
      updated_params = params.empty? ? params : Services::TransformValues.new(params).call
      perform_search(updated_params)
      show_statistics unless params.empty?
      show_cars
      save(params) unless params.empty?
    end

    private

    def save(params)
      Services::Stores::SearchStore.save(params, @statistics)
    end

    def perform_search(params)
      @total_cars = Queries::FindCars.new(collection_of_cars).call(params)
      @statistics =
        {
          total_quantity: @total_cars.length,
          requests_quantity: Services::Statistics::SameTotalRequests.new(params).call
        }
    end

    def collection_of_cars
      FileManager.read_from_yaml(file_path: Services::Stores::CarStore::DB_CARS)
    end

    def show_statistics
      View::Cars.new.output_statistics_table(@statistics)
    end

    def show_cars
      View::Cars.new.output_cars_table(@total_cars)
    end
  end
end
