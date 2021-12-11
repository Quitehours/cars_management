# frozen_string_literal: true

module MenuOptions
  class LogOutOption < OptionBase
    def ranking
      { main_menu: 1 }
    end

    def name
      I18n.t('lib.menu_options.name.log_out')
    end

    def description
      I18n.t('lib.menu_options.description.log_out')
    end

    def handler
      # Controllers::StaticPageController.new.show_options_description
    end
  end
end
