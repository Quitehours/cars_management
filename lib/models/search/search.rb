# frozen_string_literal: true

module Models
  module Search
    class Search
      attr_reader :search_rules, :sort_rules

      def initialize(search_requirements)
        @search_rules = search_requirements.slice(:make, :model, :year_from, :year_to, :price_from, :price_to)
        @sort_rules = search_requirements.slice(:sort_type, :sort_direction)
      end

      def call
        cars = collection_of_cars
        rules = transforming_values(@search_rules, @sort_rules, cars)

        filtering_list_cars(cars, rules)
      end

      private

      def collection_of_cars
        Helpers::FileManager.read_from_yaml(file_path: Models::Car::CarStorer::DB_CARS)
      end

      def filtering_list_cars(cars, rules)
        Models::Search::FilterCars.new(cars).call(rules)
      end

      def transforming_values(search_rules, sort_rules, data)
        Models::TransformingValues.new(search_rules, sort_rules, data)
      end
    end
  end
end
