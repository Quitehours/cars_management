# frozen_string_literal: true

module MenuOptions
  class HelpOption < OptionBase
    def ranking
      { main_menu: 2 }
    end

    def name
      I18n.t('lib.menu_options.name.help_option')
    end

    def description
      I18n.t('lib.menu_options.description.help_option')
    end

    def handler
      Controllers::StaticPageController.new.show_options_description
    end
  end
end
