# frozen_string_literal: true

module Models
  module SearchOperations
    class TransformingValues
      attr_reader :transform_search_rules, :transform_sort_rules, :cars

      SORT_TYPE_PRICE = 'price'
      SORT_TYPE_DATE_ADDED = 'date_added'
      SORT_DIRECTION_ASC = 'asc'
      SORT_DIRECTION_DESC = 'desc'

      def initialize(search_rules, sort_rules, cars)
        @cars = time_parse(cars)
        self.transform_search_rules = search_rules
        self.transform_sort_rules = sort_rules
      end

      private

      def transform_search_rules=(value)
        @transform_search_rules =
          {
            make: value[:make].strip.capitalize,
            model: value[:model].strip.capitalize,
            year_from: search_param_or_default(value[:year_from], min_year),
            year_to: search_param_or_default(value[:year_to], Time.now.year),
            price_from: search_param_or_default(value[:price_from], min_price),
            price_to: search_param_or_default(value[:price_to], max_price)
          }
      end

      def transform_sort_rules=(value)
        @transform_sort_rules =
          {
            sort_type: sort_param_or_default(value[:sort_type], SORT_TYPE_PRICE, SORT_TYPE_DATE_ADDED),
            sort_direction: sort_param_or_default(value[:sort_direction], SORT_DIRECTION_ASC, SORT_DIRECTION_DESC)
          }
      end

      def search_param_or_default(search_param, default)
        search_param.strip.empty? ? default : search_param.to_i
      end

      def sort_param_or_default(value, sort_param, default)
        value = value.strip.downcase

        value.include?(sort_param) ? sort_param : default
      end

      def max_price
        @cars.max_by { |car| car['price'] }['price']
      end

      def min_price
        @cars.min_by { |car| car['price'] }['price']
      end

      def min_year
        @cars.min_by { |car| car['year'] }['year']
      end

      def time_parse(data)
        data.each do |car|
          car['date_added'] = Time.strptime(car['date_added'], Models::Car::Car::DEFAULT_TYPE_DATE)
        end
      end
    end
  end
end
