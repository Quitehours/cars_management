# frozen_string_literal: true

class Console
  include Validator

  attr_accessor :hash_data

  SEARCH_REQUIRMENTS = [
    I18n.t('console.sort_parameter_make'),
    I18n.t('console.sort_parameter_model'),
    I18n.t('console.sort_parameter_year_from'),
    I18n.t('console.sort_parameter_year_to'),
    I18n.t('console.sort_parameter_price_from'),
    I18n.t('console.sort_parameter_price_to'),
    I18n.t('console.sort_option'),
    I18n.t('console.sort_direction')
  ].freeze

  def initialize
    @hash_data = {}
  end

  def call
    requirement_output
    cars_list_output(@hash_data)
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
    @hash_data = validate_data(@hash_data)
  end

  def cars_list_filtering(search_rules)
    search = Search.new(search_rules)
    search.start
  end

  def cars_list_output(search_rules)
    puts "\n#{'-' * 25}#{"\n" * 2}Results:#{"\n" * 2}"

    cars_list_filtering(search_rules).each(&:to_s)
  end
end
