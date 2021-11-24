# frozen_string_literal: true

module Statistics
  class SameTotalRequests
    THE_FIRST_REQUEST = 1

    def initialize(search_requirements)
      @search_requirements = search_requirements
    end

    def request_quantity
      result = collection_of_searches.find { |search| search[:search_requirements] == @search_requirements }
      result.nil? ? THE_FIRST_REQUEST : result[:statistics][:request_quantity]
    end

    private

    def collection_of_searches
      FileManager.read_from_yaml(file_path: SearchStore::DB_SEARCHES)
    end
  end
end
