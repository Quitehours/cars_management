# frozen_string_literal: true

module MenuOptions
  class SearchAllCarsOption < OptionBase
    def ranking
      3
    end

    def name
      I18n.t('lib.menu_options.search_all_cars_option.name')
    end

    def description
      I18n.t('lib.menu_options.search_all_cars_option.description')
    end

    def handler
      Controllers::CarsController.new.index
    end
  end
end
