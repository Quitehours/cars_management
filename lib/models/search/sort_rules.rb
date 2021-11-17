# frozen_string_literal: true

class SortRules
  attr_reader :sort_type, :sort_direction

  def initialize(args)
    @sort_type = args.fetch('sort_type', '')
    @sort_direction = args.fetch('sort_direction', '')
  end

  def to_h
    {
      'sort_type' => @sort_type,
      'sort_direction' => @sort_direction
    }
  end
end
