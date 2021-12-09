# frozen_string_literal: true

module MenuOptions
  class HelpOption < OptionBase
    def ranking
      2
    end

    def name
      I18n.t('lib.menu_options.help_option.name')
    end

    def description
      I18n.t('lib.menu_options.help_option.description')
    end

    def handler
      Controllers::StaticPageController.new.show_options_description
    end
  end
end
