# frozen_string_literal: true

module Models
  module MenuOptions
    class SearchACarOption < OptionBase
      def ranking
        4
      end

      def name
        I18n.t('app.models.menu_options.search_a_car_option.name')
      end

      def description
        I18n.t('app.models.menu_options.search_a_car_option.description')
      end

      def handler
        Controllers::SearchController.new.search_a_car
      end
    end
  end
end
