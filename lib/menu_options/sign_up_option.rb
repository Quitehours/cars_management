# frozen_string_literal: true

module MenuOptions
  class SignUpOption < BaseOption
    def name
      I18n.t('lib.menu_options.name.sign_up')
    end

    def description
      I18n.t('lib.menu_options.description.sign_up')
    end

    def handler
      Controllers::UsersController.new(context).create
    end

    def show?
      context.current_user.nil?
    end
  end
end
