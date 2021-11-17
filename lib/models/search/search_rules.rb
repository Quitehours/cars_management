# frozen_string_literal: true

class SearchRules
  attr_reader :make, :model, :year_from, :year_to, :price_from, :price_to

  def initialize(args = {})
    @make = args.fetch('make', '')
    @model = args.fetch('model', '')
    @year_from = args.fetch('year_from', '')
    @year_to = args.fetch('year_to', '')
    @price_from = args.fetch('price_from', '')
    @price_to = args.fetch('price_to', '')
  end

  def to_h
    {
      'make' => @make,
      'model' => @model,
      'year_from' => @year_from,
      'year_to' => @year_to,
      'price_from' => @price_from,
      'price_to' => @price_to
    }
  end
end
