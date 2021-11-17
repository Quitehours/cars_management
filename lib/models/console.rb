# frozen_string_literal: true

class Console
  attr_reader :searched_data

  SEARCH_REQUIRMENTS = {
    'make' => I18n.t('console.sort_parameter_make'),
    'model' => I18n.t('console.sort_parameter_model'),
    'year_from' => I18n.t('console.sort_parameter_year_from'),
    'year_to' => I18n.t('console.sort_parameter_year_to'),
    'price_from' => I18n.t('console.sort_parameter_price_from'),
    'price_to' => I18n.t('console.sort_parameter_price_to'),
    'sort_type' => I18n.t('console.sort_type'),
    'sort_direction' => I18n.t('console.sort_direction')
  }.freeze

  def initialize
    @searched_data = {}
  end

  def call
    requirement_output

    search = Search.new(@searched_data).call
    # cars_list_output(search)
  end

  private

  def requirement_output
    puts I18n.t('console.app_start')

    SEARCH_REQUIRMENTS.each do |rule, requirement|
      puts "#{requirement}:"
      @searched_data[rule] = gets.chomp
    end
  end

  # def cars_list_output(list_cars)
  #   str = <<-RESULT
  #   #{'-' * 25}

  #   #{I18n.t('console.output_results')}:

  #   #{list_cars.each { |car| car_params_output(car) }}
  #   RESULT
  #   puts str
  # end

  # def car_params_output(car)
  #   str = <<-SCHEME_CAR
  #   Id: #{car['id']}
  #   Make: #{car['make']}
  #   "Model: #{car['model']}
  #   "Year: #{car['year']}
  #   "Odometer: #{car['odometer']}
  #   "Price: #{car['price']}
  #   "Description: #{car['description']}
  #   "Date added: #{car['date_added']}
  #   SCHEME_CAR

  #   puts str
  # end
end
