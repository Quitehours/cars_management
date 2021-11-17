# frozen_string_literal: true

class Search
  attr_reader :search_rules, :sort_rules

  def initialize(search_rules)
    @search_rules = SearchRules.new(search_rules)
    @sort_rules = SortRules.new(search_rules)
  end

  def call
    cars = receive_list_cars
    transform_rules = transformating_values(@search_rules, @sort_rules)
    filtering_list_cars(transform_rules, cars)
  end

  private

  def receive_list_cars
    FileManager.read_from_yaml(file_path: CarStorer::DB_CARS) || []
  end

  def filtering_list_cars(rules, cars)
    list = FilterSearch.new(cars)
    list.filtration_by_rule('make', rules.transform_search_rules['make'])
    list.filtration_by_rule('model', rules.transform_search_rules['model'])
    list.filtration_by_range('year', rules.transform_search_rules['year_from'], rules.transform_search_rules['year_to'])
    list.filtration_by_range('price', rules.transform_search_rules['price_from'],
                             rules.transform_search_rules['price_to'])
    list.sorting(rules.transform_sort_rules['sort_type'], rules.transform_sort_rules['sort_direction'])
  end

  def transformating_values(search_rules, sort_rules)
    TransformatingValues.new(search_rules, sort_rules)
  end
end
