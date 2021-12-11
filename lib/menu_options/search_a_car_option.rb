# frozen_string_literal: true

module MenuOptions
  class SearchACarOption < OptionBase
    SEARCH_REQUIRMENTS = {
      make: I18n.t('lib.search_requirements.sort_parameter_make'),
      model: I18n.t('lib.search_requirements.sort_parameter_model'),
      year_from: I18n.t('lib.search_requirements.sort_parameter_year_from'),
      year_to: I18n.t('lib.search_requirements.sort_parameter_year_to'),
      price_from: I18n.t('lib.search_requirements.sort_parameter_price_from'),
      price_to: I18n.t('lib.search_requirements.sort_parameter_price_to'),
      sort_type: I18n.t('lib.search_requirements.sort_type'),
      sort_direction: I18n.t('lib.search_requirements.sort_direction')
    }.freeze

    def ranking
      { main_menu: 4 }
    end

    def name
      I18n.t('lib.menu_options.name.search_a_car_option')
    end

    def description
      I18n.t('lib.menu_options.description.search_a_car_option')
    end

    def handler
      Controllers::CarsController.new.index(ask_search_criteria)
    end

    private

    def ask_search_criteria
      search_criteria = {}
      puts I18n.t('lib.search_requirements.enter_option')
      SEARCH_REQUIRMENTS.map do |rule, requirement|
        puts "#{requirement}: "
        search_criteria[rule] = gets.chomp
      end

      search_criteria
    end
  end
end
