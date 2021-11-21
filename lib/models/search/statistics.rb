# frozen_string_literal: true

class Statistics
  attr_reader :total_quantity, :request_quantity

  def initialize(cars, search_requirment)
    @total_quantity = cars.length
    @request_quantity = calculate_same_requests(search_requirment)
  end

  private

  def receive_list_statistics
    FileManager.read_from_yaml(file_path: DB_SEARCHES)
  end

  def calculate_same_requests(search_rules)
    counter_requests(temp_data, search_rules)
  end

  def counter_requests(temp_data, new_rules)
    result = temp_data.find do |search|
      search.search_rules == new_rules && search.statistics.total_quantity == @total_quantity
    end

    result.nil? ? FIRST_SEARCH : result.statistics.request_quantity
  end
end
