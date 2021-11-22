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
    requirement_output
    search = Search.new(@searched_data)
    output(search)
    SearchStore.save(search)
  end

  private

  def requirement_output
    puts I18n.t('console.app_start')

    SEARCH_REQUIRMENTS.each do |rule, requirement|
      puts "#{requirement}:"
      @searched_data[rule] = gets.chomp
    end
  end

  def output(search)
    puts statistic_doc(search.statistic)
    puts result_doc
    cars = search.call
    cars.each { |car| puts car_params_doc(car) }
  end

  def car_params_doc(car)
    <<-CAR_PARAMS

    Id: #{car['id']}
    Make: #{car['make']}
    Model: #{car['model']}
    Year: #{car['year']}
    Odometer: #{car['odometer']}
    Price: #{car['price']}
    Description: #{car['description']}
    Date added: #{car['date_added'].strftime(Car::DEFAULT_TYPE_DATE)}

    #{'-' * 35}
    CAR_PARAMS
  end

  def result_doc
    <<-RESULTS
    #{'-' * 35}

    #{I18n.t('console.output_results')}:

    RESULTS
  end

  def statistic_doc(search)
    <<-STATISTIC
    #{'-' * 35}

    #{I18n.t('console.output_statistic')}:

    #{I18n.t('console.statistic_total_quantity')}: #{search[:total_quantity]}
    #{I18n.t('console.statistic_request_quantity')}: #{search[:request_quantity]}

    STATISTIC
  end
end
