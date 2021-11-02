# frozen_string_literal: true

class Search
  attr_accessor :filter_list

  def initialize
    @filter_list = FileManager.read_from_yaml
  end

  def make(search_make)
    return @filter_list if search_make.empty?

    @filter_list.map! { |car| car if car.make == search_make }.compact!
  end

  def model(search_model)
    return @filter_list if search_model.empty?

    @filter_list.map! { |car| car if car.model == search_model }.compact!
  end

  def year_range(search_year_from, search_year_to)
    range = calculate_range(search_year_from, search_year_to)
    @filter_list.map! { |car| car if range.include?(car.year) }.compact!
  end

  def price_range(search_year_from, search_year_to)
    range = calculate_range(search_year_from, search_year_to)
    @filter_list.map! { |car| car if range.include?(car.price) }.compact!
  end

  def filter_sort(option_parameter = I18.t('search.sort_option_date'), direction_parameter = I18.t('search.sort_direction_desc'))
    sort_options(option_parameter)
    sort_directions(direction_parameter)
  end

  private

  def sort_options(option_parameter)
    return @filter_list.sort_by!(&:price) if option_parameter == I18.t('search.sort_option_price')

    @filter_list.sort_by! { |car| Time.parse(car.date) }
  end

  def sort_directions(direction_parameter)
    return @filter_list if direction_parameter == 'ask'

    @filter_list.reverse
  end

  def calculate_range(from, to)
    return (0..nil) if from.zero? && to.zero?
    return (0..to) if from.zero?
    return (from..nil) if to.zero?

    (from..to)
  end
end
