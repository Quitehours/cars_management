# frozen_string_literal: true

module MenuOptions
  class SearchAllCarsOption < OptionBase
    def ranking
      { main_menu: 3 }
    end

    def name
      I18n.t('lib.menu_options.name.search_all_cars_option')
    end

    def description
      I18n.t('lib.menu_options.description.search_all_cars_option')
    end

    def handler
      Controllers::CarsController.new.index
    end
  end
end
