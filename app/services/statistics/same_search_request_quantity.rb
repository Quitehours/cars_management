# frozen_string_literal: true

module Services
  module Statistics
    class SameSearchRequestQuantity
      def initialize(initial_rules)
        @initial_rules = initial_rules
      end

      def call
        result = Repositories::SearchRepository.all.find { |search| search[:search_requirements] == @initial_rules }
        result.nil? ? 0 : result[:statistics][:requests_quantity]
      end
    end
  end
end
