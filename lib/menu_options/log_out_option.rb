# frozen_string_literal: true

module MenuOptions
  class LogOutOption < AuthenticationBaseOption
    def name
      I18n.t('lib.menu_options.name.log_out')
    end

    def description
      I18n.t('lib.menu_options.description.log_out')
    end

    def handler
      Controllers::AuthenticationController.new(context).index(action: :log_out)
    end

    def show?
      !context.current_user.nil?
    end
  end
end
