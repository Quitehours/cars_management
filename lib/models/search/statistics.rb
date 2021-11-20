# frozen_string_literal: true

class Statistics
  attr_reader :total_quantity, :request_quantity
  
  def initialize(cars, search_requirment)
    @total_quantity = cars.length
    @request_quantity = search_requirment
  end
end
