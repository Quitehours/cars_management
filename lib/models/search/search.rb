# frozen_string_literal: true

class Search
  attr_accessor :search_rules

  def initialize(hash_rules)
    @search_rules = SearchRules.new(hash_rules)
  end

  def start
    filtering_cars
  end

  private

  def filtering_cars
    temp_data = FilterSearch.new
    temp_data.make(search_rules.make)
    temp_data.model(search_rules.model)
    temp_data.year_range(search_rules.year_from, search_rules.year_to)
    temp_data.price_range(search_rules.price_from, search_rules.price_to)
    temp_data.filter_sort(search_rules.sort_option, search_rules.sort_direction)
    temp_data.filter_list
  end
end
