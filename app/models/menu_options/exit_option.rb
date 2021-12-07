# frozen_string_literal: true

module Models
  module MenuOptions
    class ExitOption < OptionBase
      def ranking
        1
      end

      def name
        I18n.t('app.models.menu_options.exit_option.name')
      end

      def description
        I18n.t('app.models.menu_options.exit_option.description')
      end

      def handler
        exit
      end
    end
  end
end
