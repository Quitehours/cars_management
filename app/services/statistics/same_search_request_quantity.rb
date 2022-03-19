# frozen_string_literal: true

module Services
  module Statistics
    class SameSearchRequestQuantity
      def initialize(initial_rules)
        @initial_rules = initial_rules
      end

      def call
        result = collection_of_searches.find { |search| search[:initial_rules] == @initial_rules }
        result.nil? ? 0 : result[:statistics][:requests_quantity]
      end

      private

      def collection_of_searches
        Repositories::CarRepository.all
      end
    end
  end
end
