# frozen_string_literal: true

module App
  module Models
    module MenuOptions
      class SearchAllCarsOption < OptionBase
        def ranking
          4
        end

        def name
          I18n.t('app.models.menu_options.search_all_cars_option.name')
        end

        def description; end
      end
    end
  end
end
