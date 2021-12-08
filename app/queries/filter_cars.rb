# frozen_string_literal: true

module Queries
  class FindCars
    attr_reader :initial_cars

    def initialize(initial_cars)
      @initial_cars = initial_cars
    end

    def call(rules)
      cars = search(@initial_cars, 'make', rules[:make])
      cars = search(cars, 'model', rules[:model])
      cars = filter_by_range(cars, 'year', rules[:year_from], rules[:year_to])
      cars = filter_by_range(cars, 'price', rules[:price_from], rules[:price_to])
      sort(cars, rules[:sort_type], rules[:sort_direction])
    end

    private

    def search(cars, param, query = nil)
      query ? cars.select { |car| car[param] == query } : cars
    end

    def filtration_by_range(cars, param, from = nil, to = nil)
      from ? cars.select { |car| car[param] > from } : cars
      to ? cars.select { |car| car[param] < to } : cars
    end

    def sorting(cars, sort_type = 'date_added', sort_direction = nil)
      sort_direction == 'asc' ? cars.sort_by { |car| car[sort_type] } : cars.sort_by { |car| car[sort_type] }.reverse
    end
  end
end
