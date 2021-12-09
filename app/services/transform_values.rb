# frozen_string_literal: true

module Services
  class TransformValues
    attr_reader :initial_rules

    TYPE_PRICE = 'price'
    TYPE_DATE_ADDED = 'date_added'
    DIRECTION_ASC = 'asc'
    DIRECTION_DESC = 'desc'

    def initialize(initial_rules)
      @initial_rules = initial_rules
    end

    def call
      search_rules = @initial_rules.slice(:make, :model)
      search_rules.each { |rule, value| value.empty? ? search_rules[rule] = nil : value.strip.capitalize }

      filter_rules = @initial_rules.slice(:year_from, :year_to, :price_from, :price_to)
      filter_rules.each { |rule, value| value.empty? ? filter_rules[rule] = nil : value.to_i }

      sort_type = @initial_rules.slice(:sort_type)
      sort_type[:sort_type] = sort_type[:sort_type] == TYPE_PRICE ? TYPE_PRICE : TYPE_DATE_ADDED

      sort_direction = @initial_rules.slice(:sort_direction)
      sort_direction[:sort_direction] =
        sort_direction[:sort_direction] == DIRECTION_ASC ? DIRECTION_ASC : DIRECTION_DESC

      search_rules.merge(filter_rules).merge(sort_type).merge(sort_direction)
    end
  end
end
