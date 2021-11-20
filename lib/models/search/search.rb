# frozen_string_literal: true

class Search
  attr_reader :search_rules, :sort_rules, :statistics

  def initialize(search_requirements)
    @search_rules = search_requirements.slice(:make, :model, :year_from, :year_to, :price_from, :price_to)
    @sort_rules = search_requirements.slice(:sort_type, :sort_direction)
    @statistics = Statistics.new(filtering_list_cars, search_requirements)
  end

  def call
    cars = receive_list_cars
    transform_rules = transformating_values(@search_rules, @sort_rules, cars)
    filtering_list_cars(transform_rules, cars)
  end

  private

  def receive_list_cars
    FileManager.read_from_yaml(file_path: CarStorer::DB_CARS)
  end

  def filtering_list_cars(rules, cars)
    FilterCars.new(cars).call(rules)
  end

  def transformating_values(search_rules, sort_rules, data)
    TransformatingValues.new(search_rules, sort_rules, data)
  end
end
