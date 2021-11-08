# frozen_string_literal: true

class Console
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

  def call
    requirement_output
  end

  def requirement_output
    puts I18n.t('console.app_start')
  end
end
