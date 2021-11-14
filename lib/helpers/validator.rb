# frozen_string_literal: true

module Validator
  DEFAULT_YEAR = 0
  DEFAULT_PRICE = 0

  def validate(args = {})
    {
      make: args.fetch(:make, '').strip.capitalize,
      model: args.fetch(:model, '').strip.capitalize,
      year_from: args.fetch(:year_from, DEFAULT_YEAR).strip.to_i,
      year_to: args.fetch(:year_to, DEFAULT_YEAR).strip.to_i,
      price_from: args.fetch(:price_from, DEFAULT_PRICE).strip.to_i,
      price_to: args.fetch(:price_to, DEFAULT_PRICE).strip.to_i,
      sort_option: args.fetch(:sort_option, '').strip.downcase,
      sort_direction: args.fetch(:sort_direction, '').strip.downcase
    }
  end
end
