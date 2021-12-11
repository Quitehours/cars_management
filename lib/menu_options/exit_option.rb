# frozen_string_literal: true

module MenuOptions
  class ExitOption < OptionBase
    def ranking
      { main_menu: 0 }
    end

    def name
      I18n.t('lib.menu_options.exit_option.name')
    end

    def description
      I18n.t('lib.menu_options.exit_option.description')
    end

    def handler
      exit
    end
  end
end
