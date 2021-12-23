# frozen_string_literal: true

module MenuOptions
  class MySearchesOption < BaseOption
    def name
      I18n.t('lib.menu_options.name.my_searches')
    end

    def description
      I18n.t('lib.menu_options.description.my_searches')
    end

    def handler
      # Controllers::StaticPageController.new(context).options_description
    end

    def show?
      !context.current_user.nil?
    end
  end
end
