# frozen_string_literal: true

module MenuOptions
  class LogOutOption < BaseOption
    def name
      I18n.t('lib.menu_options.name.log_out')
    end

    def description
      I18n.t('lib.menu_options.description.log_out')
    end

    def handler
      Controllers::SessionsController.new(context).destroy
    end

    def show?
      !context.current_user.nil?
    end
  end
end
