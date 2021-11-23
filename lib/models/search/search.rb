# frozen_string_literal: true

class Search
  attr_reader :search_rules, :sort_rules

  def initialize(search_requirements)
    @search_rules = search_requirements.slice(:make, :model, :year_from, :year_to, :price_from, :price_to)
    @sort_rules = search_requirements.slice(:sort_type, :sort_direction)
  end

  def call
    cars = collection_of_cars
    rules = transformating_values(@search_rules, @sort_rules, cars)

    filtering_list_cars(cars, rules)
  end

  private

  def collection_of_cars
    FileManager.read_from_yaml(file_path: CarStorer::DB_CARS)
  end

  def filtering_list_cars(cars, rules)
    FilterCars.new(cars).call(rules)
  end

  def transformating_values(search_rules, sort_rules, data)
    TransformatingValues.new(search_rules, sort_rules, data)
  end
end
