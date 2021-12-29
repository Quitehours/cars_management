# frozen_string_literal: true

module Controllers
  class CarsController < BaseController
    def create
      car = Models::Car.new(**create_params)
      Services::Stores::CarStore.save(car)
    end

    def index
      @found_cars = Queries::FindCars.new(collection_of_cars).call(search_params)
      @same_search_requests_quantity = Services::Statistics::SameSearchRequestQuantity.new(search_params).call
      show_statistics if search_params.any?
      Services::Stores::SearchStore.save(search_params, statistics_params) if search_params.any?
      show_cars
    end

    private

    def create_params
      params.slice(:make, :model, :year, :odometer, :price, :description)
    end

    def search_params
      @search_params ||= params.any? ? Services::TransformParams.new(params).call : params
    end

    def collection_of_cars
      Helpers::FileManagerHelper.read_from_yaml(file_path: Models::Car::DB_CARS)
    end

    def statistics_params
      {
        total_quantity: @found_cars.length,
        requests_quantity: @same_search_requests_quantity
      }
    end

    def show_statistics
      renderer.render_table(data: statistics_params, table: View::Table::StatisticsTable)
    end

    def show_cars
      renderer.render_table(data: @found_cars, table: View::Table::CarsTable)
    end
  end
end
