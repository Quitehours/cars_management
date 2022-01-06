# frozen_string_literal: true

module Controllers
  class CarsController < BaseController
    def create
      car = Models::Car.new(**create_params)
      Repositories::CarRepository.save(new_car: car.to_h)
    end

    def index
      @found_cars = Queries::FindCars.new(Repositories::CarRepository.all).call(search_params)
      @same_search_requests_quantity = Services::Statistics::SameSearchRequestQuantity.new(search_params).call
      show_statistics if search_params.any?
      Repositories::SearchRepository.save(search_params, statistics_params, context.current_user) if search_params.any?
      show_cars
    end

    private

    def create_params
      params.slice(:make, :model, :year, :odometer, :price, :description)
    end

    def search_params
      @search_params ||= params.any? ? Services::TransformParams.new(params).call : params
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
