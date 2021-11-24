# frozen_string_literal: true

class Console
  attr_reader :searched_data

  SEARCH_REQUIRMENTS = {
    make: I18n.t('console.sort_parameter_make'),
    model: I18n.t('console.sort_parameter_model'),
    year_from: I18n.t('console.sort_parameter_year_from'),
    year_to: I18n.t('console.sort_parameter_year_to'),
    price_from: I18n.t('console.sort_parameter_price_from'),
    price_to: I18n.t('console.sort_parameter_price_to'),
    sort_type: I18n.t('console.sort_type'),
    sort_direction: I18n.t('console.sort_direction')
  }.freeze

  def initialize
    @searched_data = {}
  end

  def call
    requirements_output
    total_cars = Search.new(@searched_data).call
    total_quantity = total_cars.length
    total_requests = Statistics::SameTotalRequests.new(@searched_data).request_quantity
    output(total_cars, total_requests, total_quantity)
    SearchStore.save(@searched_data, total_quantity, total_requests)
  end

  private

  def requirements_output
    puts I18n.t('console.app_start')

    SEARCH_REQUIRMENTS.each do |rule, requirement|
      puts "#{requirement}:"
      @searched_data[rule] = gets.chomp
    end
  end

  def output(total_cars, total_quantity, total_requests)
    puts ConsolePrettier::TableStatistic.new.call(total_quantity, total_requests)
    puts ConsolePrettier::TableTotalCars.new.call(total_cars)
  end
end
