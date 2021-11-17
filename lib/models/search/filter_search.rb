# frozen_string_literal: true

class FilterSearch
  attr_reader :cars

  def initialize(cars)
    @cars = time_parse(cars)
  end

  def filtration_by_rule(search_rule, requirment_user)
    return @cars if requirment_user.empty?

    @cars.select! { |car| car[search_rule] == requirment_user }
  end

  def filtration_by_range(search_rule, range_from, range_to)
    range = range_from..range_to
    return @cars if range_from.zero? && range_to.zero?

    @cars.select! { |car| range.include?(car[search_rule]) }
  end

  def sorting(sort_type, sort_direction)
    return @cars.sort_by! { |car| car[sort_type] } if sort_direction == TransformatingValues::SORT_DIRECTION_ASC

    @cars.sort_by! { |car| car[sort_type] }.reverse
  end

  private

  def time_parse(data)
    data.each { |car| car['date_added'] = Time.strptime(car['date_added'], Car::DEFAULT_TYPE_DATE) }
  end
end
