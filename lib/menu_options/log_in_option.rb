# frozen_string_literal: true

module MenuOptions
  class LogInOption < OptionBase
    def ranking
      { log_menu: 2 }
    end

    def name
      I18n.t('lib.menu_options.name.log_in')
    end

    def description
      I18n.t('lib.menu_options.description.log_in')
    end

    def handler
      # Controllers::StaticPageController.new.show_options_description
    end
  end
end
