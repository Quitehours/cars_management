# frozen_string_literal: true

module Models
  module SearchOperations
    class FilterCars
      attr_reader :cars

      def initialize(cars)
        @cars = cars
      end

      def call(rules)
        filtration_by_rule('make', rules.transform_search_rules[:make])
        filtration_by_rule('model', rules.transform_search_rules[:model])
        filtration_by_range('year', rules.transform_search_rules[:year_from], rules.transform_search_rules[:year_to])
        filtration_by_range('price', rules.transform_search_rules[:price_from],
                            rules.transform_search_rules[:price_to])
        sorting(rules.transform_sort_rules[:sort_type], rules.transform_sort_rules[:sort_direction])
      end

      private

      def filtration_by_rule(search_rule, requirment_user)
        return @cars if requirment_user.empty?

        @cars.select! { |car| car[search_rule] == requirment_user }
      end

      def filtration_by_range(search_rule, range_from, range_to)
        range = range_from..range_to
        @cars.select! { |car| range.include?(car[search_rule]) }
      end

      def sorting(sort_type, sort_direction)
        if sort_direction == Models::SearchOperations::TransformingValues::SORT_DIRECTION_ASC
          return @cars.sort_by! do |car|
                   car[sort_type]
                 end
        end

        @cars.sort_by! { |car| car[sort_type] }.reverse
      end
    end
  end
end
