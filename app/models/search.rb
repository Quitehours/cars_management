# frozen_string_literal: true

module Models
  class Search
    attr_reader :search_rules, :sort_rules

    def initialize(search_requirements)
      @search_rules = search_requirements.slice(:make, :model, :year_from, :year_to, :price_from, :price_to)
      @sort_rules = search_requirements.slice(:sort_type, :sort_direction)
    end

    def call
      data = transform_values(@search_rules, @sort_rules, collection_of_cars)
      filtering_list_cars(data)
    end

    private

    def collection_of_cars
      FileManager.read_from_yaml(file_path: Models::Car::CarStorer::DB_CARS)
    end

    def filtering_list_cars(data)
      Models::SearchOperations::FilterCars.new(data.cars).call(data)
    end

    def transform_values(search_rules, sort_rules, cars)
      Models::SearchOperations::TransformingValues.new(search_rules, sort_rules, cars)
    end
  end
end
