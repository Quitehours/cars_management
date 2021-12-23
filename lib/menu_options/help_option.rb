# frozen_string_literal: true

module MenuOptions
  class HelpOption < BaseOption
    def name
      I18n.t('lib.menu_options.name.help_option')
    end

    def description
      I18n.t('lib.menu_options.description.help_option')
    end

    def handler
      Controllers::StaticPageController.new(context).options_description
    end

    def show?
      true
    end
  end
end
