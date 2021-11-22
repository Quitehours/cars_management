# frozen_string_literal: true

class Search
  attr_reader :search_rules, :sort_rules, :statistic

  def initialize(search_requirements)
    @search_rules = search_requirements.slice(:make, :model, :year_from, :year_to, :price_from, :price_to)
    @sort_rules = search_requirements.slice(:sort_type, :sort_direction)
    @statistic = calculate_statistic(@search_rules, @sort_rules).to_h
  end

  def call
    filtering_list_cars
  end

  def to_h
    {
      search_rules: @search_rules,
      sort_rules: @sort_rules,
      statistic: @statistic
    }
  end

  private

  def calculate_statistic(search_rules, sort_rules)
    Statistic.new(filtering_list_cars, search_rules, sort_rules)
  end

  def collection_of_cars
    FileManager.read_from_yaml(file_path: CarStorer::DB_CARS)
  end

  def filtering_list_cars
    rules = transformating_values(@search_rules, @sort_rules, collection_of_cars)
    FilterCars.new(collection_of_cars).call(rules)
  end

  def transformating_values(search_rules, sort_rules, data)
    TransformatingValues.new(search_rules, sort_rules, data)
  end
end
