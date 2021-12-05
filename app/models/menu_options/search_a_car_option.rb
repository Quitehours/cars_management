# frozen_string_literal: true

module App
  module Models
    module MenuOptions
      class SearchACarOption < OptionBase
        def ranking
          3
        end

        def name
          I18n.t('app.models.menu_options.search_a_car_option.name')
        end

        def description
          I18n.t('app.models.menu_options.search_a_car_option.description')
        end
      end
    end
  end
end
