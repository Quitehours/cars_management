# frozen_string_literal: true

module MenuOptions
  class SignUpOption < OptionBase
    def ranking
      { log_menu: 2 }
    end

    def name
      I18n.t('lib.menu_options.name.sign_up')
    end

    def description
      I18n.t('lib.menu_options.description.sign_up')
    end

    def handler
      # Controllers::StaticPageController.new.show_options_description
    end
  end
end
