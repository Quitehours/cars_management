# frozen_string_literal: true

module Controllers
  class CarsController
    def create(params)
      car = Models::Car.new(**params.slice(:make, :model, :year, :odometer, :price, :description))
      Services::Stores::CarStorer.save(car)
    end

    def index(params = {})
      updated_params = params.any? ? Services::TransformValues.new(params).call : params
      perform_search(updated_params)
      show_statistics if params.any?
      Services::Stores::SearchStore.save(params, @statistics) if params.any?
      show_cars
    end

    private

    def perform_search(params)
      @total_cars = Queries::FindCars.new(collection_of_cars).call(params)
      @statistics =
        {
          total_quantity: @total_cars.length,
          requests_quantity: Services::Statistics::SameTotalRequests.new(params).call
        }
    end

    def collection_of_cars
      cars = FileManager.read_from_yaml(file_path: Services::Stores::CarStore::DB_CARS)
      cars.each { |car| car['date_added'] = Time.strptime(car['date_added'], Models::Car::DEFAULT_TYPE_DATE) }
    end

    def show_statistics
      View::Cars.new.output_statistics_table(@statistics)
    end

    def show_cars
      View::Cars.new.output_cars_table(@total_cars)
    end
  end
end
