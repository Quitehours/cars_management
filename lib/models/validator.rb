# frozen_string_literal: true

module Validator
  def validate_data(args = {})
    {
      make: args.fetch(:make, '').strip.capitalize,
      model: args.fetch(:model, '').strip.capitalize,
      year_from: args.fetch(:year_from, 0).strip.to_i,
      year_to: args.fetch(:year_to, 0).strip.to_i,
      price_from: args.fetch(:price_from, 0).strip.to_i,
      price_to: args.fetch(:price_to, 0).strip.to_i,
      sort_option: args.fetch(:sort_option, '').strip.downcase,
      sort_direction: args.fetch(:sort_direction, '').strip.downcase
    }
  end
end
