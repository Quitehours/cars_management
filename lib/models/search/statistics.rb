# frozen_string_literal: true

class Statistics
  attr_reader :total_quantity, :request_quantity

  FIRST_SEARCH = 1

  def initialize(cars, search_rules, sort_rules)
    @total_quantity = cars.length
    @request_quantity = search_same_requests(search_rules, sort_rules)
  end

  private

  def collection_of_statistics
    FileManager.read_from_yaml(file_path: SearchStore::DB_SEARCHES)
  end

  def search_same_requests(search_rules, sort_rules)
    result = collection_of_statistics.find do |search|
      search[:search_rules] == search_rules &&
        search[:sort_rules] == sort_rules &&
        search[:statistics][:total_quantity] == @total_quantity
    end

    result.nil? ? FIRST_SEARCH : result.statistics.request_quantity
  end
end
