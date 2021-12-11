# frozen_string_literal: true

module MenuOptions
  class LogInOption < OptionBase
    def ranking
      { log_menu: 2 }
    end

    def name
      I18n.t('lib.menu_options.log_in.name')
    end

    def description
      I18n.t('lib.menu_options.log_in.description')
    end

    def handler
      # Controllers::StaticPageController.new.show_options_description
    end
  end
end
