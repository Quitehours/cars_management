# frozen_string_literal: true

module Statistics
  class SameTotalRequests
    FIRST_SEARCH = 1

    def initialize(search_requirements)
      @search_requirements = search_requirements
    end

    def to_h
      {
        request_quantity: request_quantity
      }
    end

    private

    def collection_of_searches
      FileManager.read_from_yaml(file_path: SearchStore::DB_SEARCHES)
    end

    def request_quantity
      result = collection_of_searches.find { |search| search[:search_requirements] == search_requirements }
      result.nil? ? FIRST_SEARCH : result[:statistics][:request_quantity]
    end
  end
end
