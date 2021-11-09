# frozen_string_literal: true

class SearchRules
  attr_accessor :make, :model, :year_from, :year_to, :price_from, :price_to, :sort_option, :sort_direction

  def initialize(args = {})
    @make = args.fetch(:make, '')
    @model = args.fetch(:model, '')
    @year_from = args.fetch(:year_from, 0)
    @year_to = args.fetch(:year_to, 0)
    @price_from = args.fetch(:price_from, 0)
    @price_to = args.fetch(:price_to, 0)
    @sort_option = args.fetch(:sort_option, '')
    @sort_direction = args.fetch(:sort_direction, '')
  end
end
