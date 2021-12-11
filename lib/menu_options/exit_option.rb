# frozen_string_literal: true

module MenuOptions
  class ExitOption < OptionBase
    def ranking
      { main_menu: 0 }
    end

    def name
      I18n.t('lib.menu_options.name.exit_option')
    end

    def description
      I18n.t('lib.menu_options.description.exit_option')
    end

    def handler
      exit
    end
  end
end
