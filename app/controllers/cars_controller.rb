# frozen_string_literal: true

module Controllers
  class CarsController
    def create(params)
      @car = Models::Car.new(**params.slice(:make, :model, :year, :odometer, :price, :description))
      Helpers::Car::CarStorer.save(@car)
    end

    def index(params = {})
      updated_params = params.blank? ? params : TransformValues.new(params)
      perform_search(updated_params)
      show_statistics unless params.blank?
      show_cars
      save unless params.blank?
    end

    private

    def show_statistics
      
      View::SearchView.new.output_statistics_table()
    end

    def show_cars
      View::SearchView.new.output_cars_table(total_cars)
    end
  end
end
