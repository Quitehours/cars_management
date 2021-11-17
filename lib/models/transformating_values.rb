# frozen_string_literal: true

class TransformatingValues
  attr_reader :transform_search_rules, :transform_sort_rules

  SORT_TYPE_PRICE = 'price'
  SORT_TYPE_DATE_ADDED = 'date_added'
  SORT_DIRECTION_ASC = 'asc'
  SORT_DIRECTION_DESC = 'desc'

  def initialize(search_rules, sort_rules)
    self.transform_search_rules = search_rules
    self.transform_sort_rules = sort_rules
  end

  private

  def transform_search_rules=(value)
    year_range = validate_range(value.year_from, value.year_to)
    price_range = validate_range(value.price_from, value.price_to)

    @transform_search_rules =
      {
        'make' => value.make.strip.capitalize,
        'model' => value.model.strip.capitalize,
        'year_from' => year_range[:from],
        'year_to' => year_range[:to],
        'price_from' => price_range[:from],
        'price_to' => price_range[:to]
      }
  end

  def transform_sort_rules=(value)
    sort_rules = validate_sort_rules(value)

    @transform_sort_rules =
      {
        'sort_type' => sort_rules[:type],
        'sort_direction' => sort_rules[:direction]
      }
  end

  def validate_range(from, to)
    from = from.to_i
    to = to.to_i

    from = 0 if from.negative?
    # from = 0 if from > to
    to = 0 if to.negative?

    if from > to
      from = 0
      to = 0
    end

    { from: from, to: to }
  end

  def validate_sort_rules(value)
    type = value.sort_type.strip.downcase
    direction = value.sort_direction.strip.downcase

    type = type.casecmp(SORT_TYPE_PRICE).zero? ? SORT_TYPE_PRICE : SORT_TYPE_DATE_ADDED
    direction = direction.casecmp(SORT_DIRECTION_ASC).zero? ? SORT_DIRECTION_ASC : SORT_DIRECTION_DESC

    { type: type, direction: direction }
  end
end
