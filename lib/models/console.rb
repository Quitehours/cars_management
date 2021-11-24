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

  def output(total_cars, total_requests, total_quantity)
    puts statistics_string(total_requests, total_quantity)
    puts result_string
    total_cars.each { |car| puts car_params_string(car) }
  end

  def car_params_string(car)
    <<-CAR_PARAMS

    #{I18n.t('models.car.id')}: #{car['id']}
    #{I18n.t('models.car.make')}: #{car['make']}
    #{I18n.t('models.car.model')}: #{car['model']}
    #{I18n.t('models.car.year')}: #{car['year']}
    #{I18n.t('models.car.odometer')}: #{car['odometer']}
    #{I18n.t('models.car.price')}: #{car['price']}
    #{I18n.t('models.car.description')}: #{car['description']}
    #{I18n.t('models.car.date_added')}: #{car['date_added'].strftime(Car::DEFAULT_TYPE_DATE)}

    #{'-' * 35}
    CAR_PARAMS
  end

  def result_string
    <<-RESULTS
    #{'-' * 35}

    #{I18n.t('console.output_results')}:

    RESULTS
  end

  def statistics_string(total_requests, total_quantity)
    <<-STATISTICS
    #{'-' * 35}

    #{I18n.t('console.output_statistics')}:

    #{I18n.t('models.statistics.total_quantity')}: #{total_quantity}
    #{I18n.t('models.statistics.request_quantity')}: #{total_requests}

    STATISTICS
  end
end
