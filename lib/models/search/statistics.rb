# frozen_string_literal: true

module Statistics
  class SameTotalRequests

    def initialize(search_requirements)
      @search_requirements = search_requirements
    end

    def request_quantity
      result = collection_of_searches.find { |search| search[:search_requirements] == @search_requirements }
      result.nil? ? 1 : result[:statistics][:request_quantity]
    end

    private

    def collection_of_searches
      FileManager.read_from_yaml(file_path: SearchStore::DB_SEARCHES)
    end
  end
end
