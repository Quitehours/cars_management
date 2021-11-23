# frozen_string_literal: true

class Statistic
  attr_reader :total_quantity, :request_quantity

  FIRST_SEARCH = 1

  def initialize(cars, search_rules, sort_rules)
    @total_quantity = cars.length
    @request_quantity = search_same_requests(search_rules, sort_rules)
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

  def search_same_requests(search_rules, sort_rules)
    result = collection_of_searches.find do |search|
      search[:search_rules] == search_rules &&
        search[:sort_rules] == sort_rules &&
        search[:statistic][:total_quantity] == @total_quantity
    end

    result.nil? ? FIRST_SEARCH : result[:statistic][:total_quantity]
  end
end
