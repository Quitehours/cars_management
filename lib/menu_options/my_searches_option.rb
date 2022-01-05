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
      Controllers::UsersController.new(context).user_searches
    end

    def show?
      !context.current_user.nil?
    end
  end
end
