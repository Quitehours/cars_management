# frozen_string_literal: true

module App
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
          puts App::Controllers::MenuController.new.output_description_options #TODO: refactoring
        end
      end
    end
  end
end
