# frozen_string_literal: true

module MenuOptions
  class LogInOption < AuthBaseOption
    def name
      I18n.t('lib.menu_options.name.log_in')
    end

    def description
      I18n.t('lib.menu_options.description.log_in')
    end

    def handler
      Controllers::AuthController.new(context).index(action: :log_in, credentials: ask_user_info)
    end

    def show?
      context.current_user.nil?
    end
  end
end
