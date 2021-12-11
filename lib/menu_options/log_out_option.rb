# frozen_string_literal: true

module MenuOptions
  class LogOutOption < OptionBase
    def ranking
      { main_menu: 1 }
    end

    def name
      I18n.t('lib.menu_options.log_out.name')
    end

    def description
      I18n.t('lib.menu_options.log_out.description')
    end

    def handler
      # Controllers::StaticPageController.new.show_options_description
    end
  end
end
