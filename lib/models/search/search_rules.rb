# frozen_string_literal: true

class SearchRules
  attr_reader :make, :model, :year_from, :year_to, :price_from, :price_to, :sort_option, :sort_direction

  DEFAULT_YEAR = 0
  DEFAULT_PRICE = 0

  def initialize(args = {})
    @make = args.fetch(:make, '')
    @model = args.fetch(:model, '')
    @year_from = args.fetch(:year_from, DEFAULT_YEAR)
    @year_to = args.fetch(:year_to, DEFAULT_YEAR)
    @price_from = args.fetch(:price_from, DEFAULT_PRICE)
    @price_to = args.fetch(:price_to, DEFAULT_PRICE)
    @sort_option = args.fetch(:sort_option, '')
    @sort_direction = args.fetch(:sort_direction, '')
  end
end
