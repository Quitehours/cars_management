# frozen_string_literal: true

module Controllers
  class CarsController < BaseController
    def create(params)
      car = Models::Car.new(**params.slice(:make, :model, :year, :odometer, :price, :description))
      Services::Stores::CarStorerService.save(car)
    end

    def index(params = {})
      updated_params = params.any? ? Services::TransformValuesService.new(params).call : params
      perform_search(updated_params)
      show_statistics if params.any?
      Services::Stores::SearchStoreService.save(params, @statistics) if params.any?
      show_cars
    end

    private

    def perform_search(params)
      @total_cars = Queries::FindCars.new(collection_of_cars).call(params)
      @statistics =
        {
          total_quantity: @total_cars.length,
          requests_quantity: Services::Statistics::SameTotalRequestsService.new(params).call
        }
    end

    def collection_of_cars
      cars = Helpers::FileManagerHelper.read_from_yaml(file_path: Models::Car::DB_CARS)
      cars.each { |car| car['date_added'] = Time.strptime(car['date_added'], Models::Car::DEFAULT_TYPE_DATE) }
    end

    def show_statistics
      renderer.render_searches_statistics(data: @statistics, table: View::Table::StatisticsTable)
    end

    def show_cars
      renderer.render_search_result(cars: @total_cars, table: View::Table::CarsTable)
    end
  end
end
