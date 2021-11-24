# frozen_string_literal: true

class FilterCars
  attr_reader :cars

  def initialize(cars)
    @cars = time_parse(cars)
  end

  def call(rules)
    filtration_by_rule('make', rules.transform_search_rules[:make])
    filtration_by_rule('model', rules.transform_search_rules[:model])
    filtration_by_range('year', rules.transform_search_rules[:year_from], rules.transform_search_rules[:year_to])
    filtration_by_range('price', rules.transform_search_rules[:price_from], rules.transform_search_rules[:price_to])
    sorting(rules.transform_sort_rules[:sort_type], rules.transform_sort_rules[:sort_direction])
  end

  private

  def filtration_by_rule(search_rule, requirment_user)
    return @cars if requirment_user.empty?

    @cars.select! { |car| car[search_rule] == requirment_user }
  end

  def filtration_by_range(search_rule, range_from, range_to)
    range = range_from..range_to
    @cars.select! { |car| range.include?(car[search_rule]) }
  end

  def sorting(sort_type, sort_direction)
    return @cars.sort_by! { |car| car[sort_type] } if sort_direction == TransformingValues::SORT_DIRECTION_ASC

    @cars.sort_by! { |car| car[sort_type] }.reverse
  end

  def time_parse(data)
    data.each { |car| car['date_added'] = Time.strptime(car['date_added'], Car::DEFAULT_TYPE_DATE) }
  end
end
