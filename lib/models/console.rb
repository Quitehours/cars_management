# frozen_string_literal: true

class Console
  include Validator

  attr_reader :searched_data

  SEARCH_REQUIRMENTS = [
    sort_parameter_make: ['console.sort_parameter_make'],
    sort_parameter_model: ['console.sort_parameter_model'],
    sort_parameter_year_from: ['console.sort_parameter_year_from'],
    sort_parameter_year_to: ['console.sort_parameter_year_to'],
    sort_parameter_price_from: ['console.sort_parameter_price_from'],
    sort_parameter_price_to: ['console.sort_parameter_price_to'],
    sort_option: ['console.sort_option', 'console.option_kinds'],
    sort_direction: ['console.sort_direction', 'console.direction_kinds']
  ].freeze

  def initialize
    @searched_data = {}
  end

  def call
    requirement_output

    search = Search.new(@searched_data).call

    cars_list_output(search)
  end

  private

  def requirement_output
    puts I18n.t('console.app_start')

    SEARCH_REQUIRMENTS.each do |requirement|
      puts "#{I18n.t('console.default_output')} #{requirement}" \
           "#{I18n.t('console.option_kinds') if requirement == I18n.t('console.sort_option')}" \
           "#{I18n.t('console.direction_kinds') if requirement == I18n.t('console.sort_direction')}:"
      @hash_data[requirement.to_sym] = gets.chomp
    end
    @hash_data = validate(@hash_data)
  end

  def cars_list_output(list_cars)
    puts "\n#{'-' * 25}#{"\n" * 2}#{I18n.t('console.results')}:#{"\n" * 2}"

    list_cars.each { |car| puts car.to_s }
  end
end
