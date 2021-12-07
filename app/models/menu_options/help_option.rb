# frozen_string_literal: true

module Models
  module MenuOptions
    class HelpOption < OptionBase
      def ranking
        2
      end

      def name
        I18n.t('app.models.menu_options.help_option.name')
      end

      def description
        I18n.t('app.models.menu_options.help_option.description')
      end

      def handler
        Controllers::MenuController.new.show_descriptions_menu_options
      end
    end
  end
end
