# frozen_string_literal: true

class Statistics
  FIRST_SEARCH = 1

  def initialize(cars, search_requirements)
    @total_quantity = cars.length
    self.request_quantity = search_requirements
  end

  def to_h
    {
      total_quantity: @total_quantity,
      request_quantity: @request_quantity
    }
  end

  private

  def collection_of_searches
    FileManager.read_from_yaml(file_path: SearchStore::DB_SEARCHES)
  end

  def request_quantity=(search_requirements)
    result = collection_of_searches.find { |search| search[:search_requirements] == search_requirements }
    @request_quantity = result.nil? ? FIRST_SEARCH : result[:statistics][:request_quantity]
  end
end
