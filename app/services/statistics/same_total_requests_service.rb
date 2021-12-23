# frozen_string_literal: true

module Services
  module Statistics
    class SameTotalRequestsService
      def initialize(intial_rules)
        @intial_rules = intial_rules
      end

      def call
        result = collection_of_searches.find { |search| search[:intial_rules] == @search_requirements }
        result.nil? ? 1 : result[:statistics][:requests_quantity]
      end

      private

      def collection_of_searches
        Helpers::FileManagerHelper.read_from_yaml(file_path: Services::Stores::SearchStoreService::DB_SEARCHES)
      end
    end
  end
end
