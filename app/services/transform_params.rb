# frozen_string_literal: true

module Services
  class TransformParams
    attr_reader :initial_rules

    TYPE_PRICE = 'price'
    TYPE_DATE_ADDED = 'date_added'
    DIRECTION_ASC = 'asc'
    DIRECTION_DESC = 'desc'

    def initialize(initial_rules)
      @initial_rules = initial_rules
    end

    def call
      search_rules.merge(filter_rules).merge(sort_type).merge(sort_direction)
    end

    private

    def search_rules
      search_rules = @initial_rules.slice(:make, :model)
      search_rules.each do |rule, value|
        search_rules[rule] = value.empty? ? nil : value.strip.capitalize
      end
    end

    def filter_rules
      filter_rules = @initial_rules.slice(:year_from, :year_to, :price_from, :price_to)
      filter_rules.each { |rule, value| filter_rules[rule] = value.empty? ? nil : value.to_i }
    end

    def sort_type
      type = @initial_rules.slice(:sort_type)
      type[:sort_type] = type[:sort_type] == TYPE_PRICE ? TYPE_PRICE : TYPE_DATE_ADDED
      type
    end

    def sort_direction
      direction = @initial_rules.slice(:sort_direction)
      direction[:sort_direction] = direction[:sort_direction] == DIRECTION_ASC ? DIRECTION_ASC : DIRECTION_DESC
      direction
    end
  end
end
